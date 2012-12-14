class SplitPersonName < ActiveRecord::Migration
  def up
    rename_column :people, :name, :family_name
    add_column :people, :given_name, :string
    add_column :people, :title, :string
  end

  def down
    rename_column :people, :family_name, :name
    remove_column :people, :given_name
    remove_column :people, :title
  end
end
