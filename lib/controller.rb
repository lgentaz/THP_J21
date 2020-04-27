require 'gossip'

# Ce fichier correspond à la classe Controller. 
# Il permet d'effectuer des requetes get pour afficher une info stockée
# Il permet d'effectuer des requetes post pour mettre à jour la BDD

class ApplicationController < Sinatra::Base
	
	get '/' do
		erb :index, locals: {gossips: Gossip.all} #affiche la page d'accueil et appelle la méthode all du fichier gossip.rb
	end	

	get '/gossips/new/' do
		erb :new_gossip #affiche la page de création d'un potin
	end	
	
	post '/gossips/new/' do
		Gossip.new(params["gossip_author"],params["gossip_content"]).save #envoie les nouvelles infos vers la BDD par la méthode save du fichier gossip.rb
		redirect '/' #redirige le navigateur vers la page d'accueil
	end

	get '/gossips/:id' do
		erb :show, locals: {gossip: Gossip.find(params['id'])} #récupère et affiche les données d'un potin
	end

	get '/gossips/:id/edit/' do
		erb :edit, locals: {gossip: Gossip.find(params['id'])} #récupère les données d'un potin et affiche sa page de modification
	end

	post '/gossips/edit/:id' do
		Gossip.update(params["id"], params["gossip_content"]) #met à jour la BDD par la méthode update du fichier gossip.rb, d'après les modifications entrées
		redirect '/' #redirige le navigateur vers la page d'accueil

	end

end