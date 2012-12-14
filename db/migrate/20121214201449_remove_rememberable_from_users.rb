class RemoveRememberableFromUsers < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.remove :remember_created_at
    end
  end
end
