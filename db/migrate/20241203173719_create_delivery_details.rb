class CreateDeliveryDetails < ActiveRecord::Migration[8.0]
  def change
    create_table :delivery_details do |t|
      t.date :date

      t.timestamps
    end
  end
end
