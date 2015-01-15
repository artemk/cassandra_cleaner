module CassandraCleaner
  class Configuration
    attr_accessor :cleaner_tag, :debug, :client

    def initialize
      @cleaner_tag = :clean_cassandra
      @debug = false
      @client = nil
    end

    def enable
      RSpec.configure do |config|
        config.include CassandraCleaner::RspecHelper
      end
    end
  end
end