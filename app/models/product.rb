class Product < ApplicationRecord

	has_many :delivery_details 

	validates :name, :price, presence: true
end
