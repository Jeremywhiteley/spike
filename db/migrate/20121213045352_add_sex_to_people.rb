class AddSexToPeople < ActiveRecord::Migration
  def up
    add_column :people, :sex_id, :integer
  end

  def down
    remove_column :people, :sex_id
  end
end
