module CassandraCleaner
  class RspecNotifier
    def initialize
      @column_families = []
    end

    def receive(table_name)
      @column_families << table_name    
    end

    def show_info
      puts "\nColumn Families used in tests"
      pp @column_families.uniq
    end

    def tables
      @column_families.uniq
    end
  end
end