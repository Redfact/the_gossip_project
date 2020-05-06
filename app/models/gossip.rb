class Gossip < ApplicationRecord
	belongs_to :user
	has_many :JoinTagGossip
	has_many :tags ,:through => :JoinTagGossip

	validates :title , presence:true ,length:{in: 3..30}
	validates :content , presence:true
end
