class Gossip < ApplicationRecord
	belongs_to :user
	has_many :JoinTagGossip
	has_many :tags ,:through => :JoinTagGossip
	has_many :comments
	has_many :likes
	has_many :users,:through => :likes

	validates :title , presence:true ,length:{in: 3..60}
	validates :content , presence:true
end
