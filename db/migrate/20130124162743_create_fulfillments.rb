class CreateFulfillments < ActiveRecord::Migration
  def change
    create_table :fulfillments do |t|
      t.datetime :when_filled
      t.string :quantity_unit
      t.decimal :quantity_amount
      t.integer :prescription_id
      t.integer :pharmacist_id
      t.integer :pharmacy_id
      t.string  :fill_status
      t.string  :prescription_number

      t.timestamps
    end
  end
end
