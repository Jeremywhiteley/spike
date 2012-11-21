class Prescription < ActiveRecord::Base
  attr_accessible :patient_id, :prescriber_id, :drug_id, :when_written
  belongs_to :patient, :class_name => Person
  belongs_to :prescriber, :class_name => Person
  belongs_to :drug
end
