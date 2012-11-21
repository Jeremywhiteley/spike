class CreatePrescriptions < ActiveRecord::Migration
  def change
    create_table :prescriptions do |t|
      t.integer :patient_id
      t.integer :prescriber_id
      t.integer :drug_id
      t.datetime :when_written

      t.timestamps
    end
  end
end
