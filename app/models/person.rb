class Person < ActiveRecord::Base
  validates :name, :presence => true
  validates :sex_id, :presence => true
  attr_accessible :name, :sex_id
  belongs_to :sex
  has_many :prescriptions_received, :class_name => Prescription, :foreign_key => :patient_id
  has_many :prescriptions_written, :class_name => Prescription, :foreign_key => :prescriber_id


  def self.search(search)
    if search
      find(:all, :conditions => ['name LIKE ?', "%#{search}%"])
    else
      find(:all)
    end
  end

end
