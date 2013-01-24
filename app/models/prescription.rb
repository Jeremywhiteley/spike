class Prescription < ActiveRecord::Base
  validates :patient_id, :presence => true
  validates :prescriber_id, :presence => true
  validates :drug_id, :presence => true
  attr_accessible :patient_id, :prescriber_id, :drug_id, :when_written
  belongs_to :patient, :class_name => Person
  belongs_to :prescriber, :class_name => Person
  belongs_to :drug
  has_many :fulfillments
end
