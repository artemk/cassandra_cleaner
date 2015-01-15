# encoding: utf-8

ENV['CASSANDRA_HOST'] ||= 'localhost'
ENV['CASSANDRA_CLEANER_KEYSPACE'] ||= 'cassandra_cleaner_test'

require "bundler"
Bundler.setup

require 'cassandra_cleaner'
CQL_CLIENT = Cql::Client.connect(hosts: [ENV['CASSANDRA_HOST']])

Dir['./spec/support/**/*.rb'].sort.each { |f| require f }