require 'bundler'
Bundler.require

class Gossip
	attr_accessor :author, :content
	
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
		all_gossips = []		
		CSV.foreach("./db/gossip.csv") do |row|
			one_row = Gossip.new(row[0],row[1])
			all_gossips << one_row
		end
		return all_gossips
	end
end