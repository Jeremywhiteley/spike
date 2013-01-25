class AddFieldsToPrescription < ActiveRecord::Migration
  def change
    add_column :prescriptions, :free_text_sig, :string
    add_column :prescriptions, :effective_start, :datetime
    add_column :prescriptions, :effective_end, :datetime
    add_column :prescriptions, :order_number, :string
    add_column :prescriptions, :fills_count, :integer
    add_column :prescriptions, :quantity_amount, :decimal
    add_column :prescriptions, :quantity_units, :string
    add_column :prescriptions, :expiration, :datetime
  end
end
