# CassandraCleaner

it is like database_cleaner but for cql-rb (cassandra)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'cassandra_cleaner'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install cassandra_cleaner

## Usage

Add config in rspec_helper.rb

```ruby
require 'cassandra_cleaner'
CassandraCleaner.configure do |config|
  config.cleaner_tag = :cassandra_clean
  config.debug = false
  config.client = CQL_CLIENT #aimed that CQL_CLIENT is some constanst set before, i.e. CQL_CLIENT = Cql::Client.connect(hosts: ['cassandra.example.com'])
  config.enable
end
```

And mark some test with a tag you set in config section

```ruby
it "should test something", :cassandra_clean do
  #test me
end
```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/cassandra_cleaner/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request


#TODO
1. add warning if update or insert not in CassandraCleaner.configured_column_families
2. more specs