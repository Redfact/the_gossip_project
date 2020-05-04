class Gossip < ApplicationRecord
		belongs_to :user
	has_many :JoinTagGossip
	has_many :tags ,:through => :JoinTagGossip
end
