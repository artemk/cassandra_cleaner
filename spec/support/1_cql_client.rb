RSpec.configure do |config|
  config.before(:suite) do

    #create test keyspace
    keyspace_definition = <<-KSDEF
  CREATE KEYSPACE #{ENV['CASSANDRA_CLEANER_KEYSPACE']}
  WITH replication = {
    'class': 'SimpleStrategy',
    'replication_factor': 1
  }
KSDEF
    CQL_CLIENT.execute("DROP KEYSPACE #{ENV['CASSANDRA_CLEANER_KEYSPACE']}") rescue nil
    CQL_CLIENT.execute(keyspace_definition)
    CQL_CLIENT.use(ENV['CASSANDRA_CLEANER_KEYSPACE'])
  end

  config.after(:suite) do
    
    #drop keyspace
    CQL_CLIENT.execute("DROP KEYSPACE #{ENV['CASSANDRA_CLEANER_KEYSPACE']}") rescue nil

    #close test connection
    CQL_CLIENT.close
  end
end



