class Fulfillment < ActiveRecord::Base
  attr_accessible :pharmacist_id, :pharmacy_id, :prescription_id, :quantity_amount, :quantity_unit, :when_filled, :fill_status, :prescription_number
  validates :prescription_id, :presence => true
  validates :pharmacy_id, :presence => true
  validates :pharmacist_id, :presence => true
  belongs_to :prescription
  belongs_to :pharmacist, :class_name => Person
  belongs_to :pharmacy
end
