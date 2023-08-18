require 'spec_helper'
ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'rspec/rails'
require 'database_cleaner'

begin
  ActiveRecord::Migration.maintain_test_schema!
rescue ActiveRecord::PendingMigrationError => e
  puts e.to_s.strip
  exit 1
end
RSpec.configure do |config|
  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.use_transactional_fixtures = true
  config.infer_spec_type_from_file_location!
  config.filter_rails_from_backtrace!
  config.before(:each, type: :system) do
    driven_by(:rack_test)
  end

  DatabaseCleaner.strategy = :truncation

  # RSpecの実行前に1度、実行
  config.before(:suite) do
    DatabaseCleaner.clean
  end

  # rspecでいうexample、turnipでいうシナリオが終わるごとに実行
  config.before(:each) do
    DatabaseCleaner.clean
  end  

  # 最後に1度、実行
  config.after(:suite) do
    DatabaseCleaner.clean
  end

end
