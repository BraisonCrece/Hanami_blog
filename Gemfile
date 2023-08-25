# frozen_string_literal: true

source "https://rubygems.org"

gem "hanami", "~> 2.0"
gem "hanami-router", "~> 2.0"
gem "hanami-controller", "~> 2.0"
gem "hanami-validations", "~> 2.0"

gem "dry-types", "~> 1.0", ">= 1.6.1"
gem "puma"
gem "rake"

# ORM and Database Adapter
gem "rom", "~> 5.3"
gem "rom-sql", "~> 3.6"
gem "pg"

group :development do
  gem "guard-puma", "~> 0.8"
end

group :test do
  gem "rack-test"
  gem "database_cleaner-sequel"
end

group :development, :test do
  gem "dotenv"
  gem "debug", ">= 1.0.0"
end

group :cli, :development do
  gem "hanami-reloader"
end

group :cli, :development, :test do
  gem "hanami-rspec"
end


