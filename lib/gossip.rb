require 'bundler'
Bundler.require

# Ce fichier correspond à la classe Gossip. 
# Il permet de créer des instances "potins" (gossips), de les enregistrer ou de les modifier

class Gossip
	attr_accessor :author, :content
	@@all_gossips = []
	
	def initialize(author, content)
# Initialize un nouveau potin
		@author = author
		@content = content
	end

	def save
# Sauvegarde du potin à la suite dans le fichier csv
		CSV.open("./db/gossip.csv", "ab") do |csv|
			csv << [@author, @content]		
		end
	end

	def self.all
# Lecture du fichier csv et renvoie de la totalité des entrées du fichier
		CSV.foreach("./db/gossip.csv") do |row|
			one_row = Gossip.new(row[0],row[1])
			@@all_gossips << one_row
		end
		return @@all_gossips
	end

	def self.find(id)
# Renvoie un potin de numéro spécifique (pour l'afficher)
		n = id.to_i
		gossip_select = self.all[n-1]

		return gossip_select	
	end

	def self.update(id, content_update)
# Met à jour le fichier csv
		n = id.to_i - 1
		gossip_update = []
# Sauvegarde dans un tableau
		gossip_update = self.all
# Ecrase les infos du csv
		CSV.open("./db/gossip.csv", "w") do |csv|
# Réinjecte le tableau dans le csv...
			gossip_update.each_with_index do |gossip|
				if n == gossip_update.index(gossip)
# ...en mettant à jour le potin modifier
					csv << [gossip.author, content_update]
				else
					csv << [gossip.author, gossip.content]
				end
			end
		end
	end

end