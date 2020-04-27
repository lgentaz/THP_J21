require 'bundler'
Bundler.require

class Gossip
	attr_accessor :author, :content
	@@all_gossips = []
	
	def initialize(author, content)
		@author = author
		@content = content

	end

	def save
		CSV.open("./db/gossip.csv", "ab") do |csv|
			csv << [@author, @content]		
		end
	end

	def self.all
		CSV.foreach("./db/gossip.csv") do |row|
			one_row = Gossip.new(row[0],row[1])
			@@all_gossips << one_row
		end
		return @@all_gossips
	end

	def self.find(id)
		n = id.to_i
		gossip_select = self.all[n-1]

		return gossip_select	
	end

	def self.update(id, content_update)
		n = id.to_i - 1
		gossip_update = []
		gossip_update = self.all
		CSV.open("./db/gossip.csv", "w") do |csv|
			gossip_update.each_with_index do |gossip|
				if n == gossip_update.index(gossip)
					csv << [gossip.author, content_update]
				else
					csv << [gossip.author, gossip.content]
				end
			end
		end
	end

end