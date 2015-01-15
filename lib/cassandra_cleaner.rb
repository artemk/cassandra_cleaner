$LOAD_PATH.unshift(File.dirname(__FILE__))

require "cql"

require_relative "cassandra_cleaner/version"
require_relative 'cassandra_cleaner/configuration'

module CassandraCleaner
  class << self
    def configure(&block)
      yield configuration
    end

    def configuration
      @configuration ||= Configuration.new
    end

    def configured_column_families
      configuration.client.execute("select columnfamily_name from system.schema_columnfamilies where keyspace_name = '#{configuration.client.keyspace}'").to_a.map(&:values).flatten
    end

    def add_rspec_notifier(rspec_notifier)
      @@rspec_notifiers ||= []
      @@rspec_notifiers << rspec_notifier
    end

    def unregister_notifiers
      @@rspec_notifiers = []
    end

    def rspec_notifiers
      @@rspec_notifiers ||= []
    end
  end
end

require_relative 'cassandra_cleaner/rspec_helper'
require_relative 'cassandra_cleaner/rspec_notifier'
require_relative 'cassandra_cleaner/cql_rspec_notifications'
require_relative 'cassandra_cleaner/cql'
