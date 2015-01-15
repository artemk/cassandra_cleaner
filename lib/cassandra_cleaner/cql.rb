# monkey patching cql-rb classes
# todo: add batch
module Cql
  module Client
    class SynchronousClient
      include CassandraCleaner::CqlRspecNotifications::Client
      include CassandraCleaner::CqlRspecNotifications::Base
    end

    class AsynchronousClient
      include CassandraCleaner::CqlRspecNotifications::Client
      include CassandraCleaner::CqlRspecNotifications::Base
    end

    class AsynchronousPreparedStatement
      include CassandraCleaner::CqlRspecNotifications::PreparedStatement
      include CassandraCleaner::CqlRspecNotifications::Base
    end

    class SynchronousPreparedStatement
      include CassandraCleaner::CqlRspecNotifications::PreparedStatement
      include CassandraCleaner::CqlRspecNotifications::Base
    end
  end
end