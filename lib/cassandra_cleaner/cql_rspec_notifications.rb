require 'cql/client/client'

module CassandraCleaner  
  module CqlRspecNotifications

    module Base
      def self.included(host)
        host.class_eval do
          alias_method :execute_without_notify, :execute
          alias_method :execute, :execute_with_notify
        end

      end

      def notify_observers(table_name)
        notifiers = CassandraCleaner.rspec_notifiers
        notifiers.each{|n| n.receive(table_name)} if notifiers && table_name
      end
    end

    module Client
      def execute_with_notify(*args)
        res = execute_without_notify(*args)
        table_name = grap_table_name(args)
        notify_observers(table_name)
        res
      end

      def grap_table_name(args)
        $1.split('.').last if args && args.first.match(/(?:INSERT INTO|UPDATE)\s([\w\.]*)\s.*/)        
      end 
    end

    module PreparedStatement
      def execute_with_notify(*args)
        res = execute_without_notify(*args)
        table_name = self.metadata.instance_variable_get(:@metadata).try(:first).try(:last).try(:table)
        notify_observers(table_name)
        res
      end
    end

  end
end