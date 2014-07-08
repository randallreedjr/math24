require_relative "../lib/math24solvercli.rb"
#require "math24"

 ENV['SINATRA_ENV'] ||= "development"

require 'bundler/setup'
Bundler.require(:default, ENV['SINATRA_ENV'])

# ActiveRecord::Base.establish_connection(
#   :adapter => "sqlite3",
#   :database => "db/math24#{ENV['SINATRA_ENV']}.sqlite"
# )

require_all 'app'