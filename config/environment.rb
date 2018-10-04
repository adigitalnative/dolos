require 'bundler/setup'
Bundler.require

require 'active_record'
require 'rake'
require 'colorize'

# Require all of our models and lib files
Dir[File.join(File.dirname(__FILE__), "../lib", "*.rb")].each {|f| require f}
Dir[File.join(File.dirname(__FILE__), "../app/models", "*.rb")].each {|f| require f}


# Set up the database based on our env & database.yml
ENV["DOLOS_ENV"] ||= "development"

ActiveRecord::Base.establish_connection(
  YAML.load(File.read('config/database.yml'))[ENV["DOLOS_ENV"]]
)

DB = ActiveRecord::Base.connection

if ENV["DOLOS_ENV"] == "test"
  ActiveRecord::Migration.verbose = true
end