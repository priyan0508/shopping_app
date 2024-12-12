class Address < ApplicationRecord

	belongs_to :user 

	validates :colony, :city, :pincode, :country, presence: true
end
