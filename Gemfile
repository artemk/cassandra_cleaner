source 'https://rubygems.org'

# Specify your gem's dependencies in cassandra_cleaner.gemspec
gemspec

gem 'cql-rb', '~> 2.0.0'

group :test do
  gem 'rspec', '>= 3.0'
end

group :development do
  gem "guard-rspec", "~> 4.4.2", require: false
end

group :development, :test do
  gem "guard", "~> 2.11"
end