ENV["DOLOS_ENV"] ||= "development"

require_relative './config/environment'
require 'sinatra/activerecord/rake'

# Type `rake -T` on your command line to see the available rake tasks.

task :console do
  Pry.start
end

namespace :factory do
  desc "create a new bot with given name, NAME='the name'"
  task :create_bot do
    touch "./spec/factories/#{ENV['NAME']}.rb"
  end
end