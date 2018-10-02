#!/usr/bin/env ruby

require_relative '../config/environment'

ActiveRecord::Base.logger.level = 1 


@dolos = Dolos::GameRunner.new

@dolos.run