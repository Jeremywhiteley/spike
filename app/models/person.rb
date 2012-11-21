class Person < ActiveRecord::Base
  validates :name, :presence => true
  attr_accessible :name
  has_many :prescriptions_received, :class_name => Prescription, :foreign_key => :patient_id
  has_many :prescriptions_written, :class_name => Prescription, :foreign_key => :prescriber_id
end
