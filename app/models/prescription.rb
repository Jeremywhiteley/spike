class Prescription < ActiveRecord::Base
  validates :patient_id, :presence => true
  validates :prescriber_id, :presence => true
  validates :drug_id, :presence => true
  validates :order_number, :presence => true
  validates :quantity_amount, :presence => true
  validates :quantity_units, :presence => true
  validates :effective_start, :presence => true
  validates :effective_end, :presence => true
  attr_accessible :patient_id, :prescriber_id, :drug_id, :when_written, :expiration, :free_text_sig, :effective_start, :effective_end, :order_number, :fills_count, :quantity_amount, :quantity_units
  belongs_to :patient, :class_name => Person
  belongs_to :prescriber, :class_name => Person
  belongs_to :drug
  has_many :fulfillments
end
