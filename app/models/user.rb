class User < ApplicationRecord
	has_secure_password
	belongs_to :city ,optional:true
	has_many :gossips
	has_many :sent_messages,foreign_key:'sender_id',class_name: 'PrivateMessage'
	has_many :comments
	validates :first_name , presence: true
	validates :email , presence: true , format: { with: URI::MailTo::EMAIL_REGEXP } , uniqueness: true
	validates :password , presence: true , length:{minimum: 5}
end
