class Tag < ApplicationRecord
	has_many :JoinTagGossip
	has_many :gossips,:through => :JoinTagGossip
end
