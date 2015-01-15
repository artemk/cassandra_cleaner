CassandraCleaner.configure do |config|
  config.cleaner_tag = :cassandra_clean
  config.debug = false
  config.client = CQL_CLIENT
  config.enable
end