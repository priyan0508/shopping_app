class DeliveryDetail < ApplicationRecord

	belongs_to :product

	validates :date, presence: true
end
