require 'gossip'

class ApplicationController < Sinatra::Base
	get '/' do
		erb :index, locals: {gossips: Gossip.all}
	end	

	get '/gossips/new/' do
		erb :new_gossip
	end	
	
	post '/gossips/new/' do
		Gossip.new(params["gossip_author"],params["gossip_content"]).save
		redirect '/' #redirige le navigateur vers la page d'accueil
	end

	get '/gossips/:id' do
		id = params['id']
		erb :new_gossip
		erb :show, locals: {gossip: Gossip.find(id)}
	end

end