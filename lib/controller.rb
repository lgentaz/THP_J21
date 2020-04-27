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
		erb :show, locals: {gossip: Gossip.find(params['id'])}
	end

	get '/gossips/:id/edit/' do
		erb :edit, locals: {gossip: Gossip.find(params['id'])}
	end

	post '/gossips/edit/:id' do
		Gossip.update(params["id"], params["gossip_content"])
		redirect '/' #redirige le navigateur vers la page d'accueil

	end

end