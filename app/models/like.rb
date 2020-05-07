class Like < ApplicationRecord
	belongs_to :user
	belongs_to :gossip

	#un user ne peut pas aimer plusieures fois un memes gossip
	#l'ID des gossip dans User.likes sont unique
	validates_uniqueness_of :gossip_id, :scope => :user_id
end
