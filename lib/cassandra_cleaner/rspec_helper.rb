require 'rspec'

module CassandraCleaner
  module RspecHelper
    def self.included(rspec_config)
      rspec_config.before(:each, CassandraCleaner.configuration.cleaner_tag => true) do
        CassandraCleaner.add_rspec_notifier(CassandraCleaner::RspecNotifier.new)
      end

      rspec_config.after(:each, CassandraCleaner.configuration.cleaner_tag => true) do
        begin
          CassandraCleaner.rspec_notifiers.each do |n| 
            n.show_info if CassandraCleaner.configuration.debug
            
            table_for_truncation = n.tables & CassandraCleaner.configured_column_families
            unless table_for_truncation.empty?
              table_for_truncation.each do |column_family|
                CassandraCleaner.configuration.client.execute("TRUNCATE #{column_family}")
              end
            end
          end
        ensure
          CassandraCleaner.unregister_notifiers
        end
      end
    end
  end
end