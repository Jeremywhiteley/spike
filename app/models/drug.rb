class Drug < ActiveRecord::Base
  attr_accessible :name, :ndc_code, :ndc_name, :rxnorm_code, :rxnorm_name, :dose_amount, :dose_unit
  validates :name, :presence => true
  validates :ndc_code, :presence => true
  validates :ndc_name, :presence => true
  validates :rxnorm_code, :presence => true
  validates :rxnorm_name, :presence => true
  validates :dose_amount, :presence => true
  validates :dose_unit, :presence => true
end
