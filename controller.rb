require 'bundler'
Bundler.require
#require_relative '...'

class ApplicationController < Sinatra::Base
	get '/' do
		"<html><head><title>The Gossip Project</title></head><body><h1>Mon super site de gossip !</h1></body></html>"
	end	
	
	run! if app_file == $0
end