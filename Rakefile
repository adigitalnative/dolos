ENV["DOLOS_ENV"] ||= "development"

require_relative './config/environment'
require 'sinatra/activerecord/rake'


# TODO: Make sure this runs in environment
task :console do
  Pry.start
end

namespace :factory do
  desc "create a new bot with given name, NAME='the name'"
  task :create_bot do
    touch "./spec/factories/#{ENV['NAME']}.rb"
  end
end

desc "Start up the game from rake"
task :start do
  Rake::Task["db:seed"].invoke
  ruby "bin/dolos.rb"
end