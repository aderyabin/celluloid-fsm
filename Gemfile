require File.expand_path("../culture/sync", __FILE__)
source "https://rubygems.org"

gemspec development_group: :gem_build_tools

group :development do
  gem "pry"
  # gem 'guard'
  # gem 'guard-rspec'
  # gem 'rb-fsevent', '~> 0.9.1' if RUBY_PLATFORM =~ /darwin/
end

group :test do
  gem "dotenv", "~> 2.0"
  gem "nenv"
  gem "benchmark_suite"
  gem "rspec", "~> 3.2"
end

group :gem_build_tools do
  gem "rake"
end

Celluloid::Sync.gems(self)
