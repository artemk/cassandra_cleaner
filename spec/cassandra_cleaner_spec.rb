require 'spec_helper'

describe CassandraCleaner do
  let(:cql_client) { CQL_CLIENT }
  let(:keyspace) { ENV['CASSANDRA_CLEANER_KEYSPACE'] }

  before(:all) do 
    CQL_CLIENT.execute("CREATE TABLE #{ENV['CASSANDRA_CLEANER_KEYSPACE']}.users (id INT, name TEXT, PRIMARY KEY (id))")
    CQL_CLIENT.execute("CREATE TABLE #{ENV['CASSANDRA_CLEANER_KEYSPACE']}.posts (id INT, title TEXT, PRIMARY KEY (id))")
  end

  after(:all) do
    CQL_CLIENT.execute("DROP TABLE #{ENV['CASSANDRA_CLEANER_KEYSPACE']}.users")
    CQL_CLIENT.execute("DROP TABLE #{ENV['CASSANDRA_CLEANER_KEYSPACE']}.posts")
  end

  describe "truncation" do
    it "should not truncate anything after this spec" do
      cql_client.execute("INSERT INTO #{keyspace}.users (id, name) VALUES (1, 'Artem K')")
      expect(CassandraCleaner.rspec_notifiers.map(&:tables)).to eq([])
    end

    it "should truncate users after this spec", :cassandra_clean do
      cql_client.execute("INSERT INTO #{keyspace}.users (id, name) VALUES (1, 'Artem K')")
      expect(CassandraCleaner.rspec_notifiers.map(&:tables)).to eq([["users"]])
    end
  end

  describe ".configured_column_families" do
    it "should return column families that are part of keyspace" do
      expect(CassandraCleaner.configured_column_families).to eq(["posts", "users"])
    end
  end

end