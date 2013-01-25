class AddCodesToDrug < ActiveRecord::Migration
  def change
    add_column :drugs, :ndc_code, :string
    add_column :drugs, :ndc_name, :string
    add_column :drugs, :rxnorm_code, :string
    add_column :drugs, :rxnorm_name, :string
    add_column :drugs, :dose_amount, :string
    add_column :drugs, :dose_unit, :string
  end
end
