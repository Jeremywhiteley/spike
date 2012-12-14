class Person < ActiveRecord::Base
  validates :family_name, :presence => true
  validates :sex_id, :presence => true
  attr_accessible :title, :given_name, :family_name, :sex_id, :birthdate
  belongs_to :sex
  has_many :prescriptions_received, :class_name => Prescription, :foreign_key => :patient_id
  has_many :prescriptions_written, :class_name => Prescription, :foreign_key => :prescriber_id

  def name
    name = ""
    name += title + " " if title
    name += given_name + " " if given_name
    name += family_name
    name
  end

  def self.search(search)
    if search
      find(:all, :conditions => ['family_name LIKE ? or given_name LIKE ?', "%#{search}%", "%#{search}%"])
    else
      find(:all)
    end
  end

end
