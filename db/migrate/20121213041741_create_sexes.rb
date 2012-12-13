class CreateSexes < ActiveRecord::Migration
  def change
    create_table :sexes do |t|
      t.string :code
      t.string :display_name
      t.string :original_text
      t.string :code_system
      t.string :code_system_name

      t.timestamps
    end
  end
end
