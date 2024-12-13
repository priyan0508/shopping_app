class AddProductIdToDeliveryDetails < ActiveRecord::Migration[8.0]
  def change
    add_column :delivery_details, :product_id, :integer
  end
end
