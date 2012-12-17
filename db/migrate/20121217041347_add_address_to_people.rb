class AddAddressToPeople < ActiveRecord::Migration
  def change
    add_column :people, :address_id, :integer
  end
end
