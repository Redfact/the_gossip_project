class Privatemessage < ApplicationRecord
	belongs_to :sender , class_name: "User"
	has_many :receiver , class_name: "User"
end
