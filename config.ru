# This file is used by Rack-based servers to start the application.

require_relative 'config/environment'

run Rails.application

require 'launchy'
require ::File.expand_path('../config/environment', __FILE__)
run Rails.application
Launchy.open("http://localhost:7777") if Rails.env.development?
