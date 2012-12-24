class Person < ActiveRecord::Base
  validates :family_name, :presence => true
  validates :sex_id, :presence => true
  attr_accessible :title, :given_name, :family_name, :sex_id, :birthdate, :address_id, :address_attributes
  belongs_to :sex
  belongs_to :address
  has_many :prescriptions_received, :class_name => Prescription, :foreign_key => :patient_id
  has_many :prescriptions_written, :class_name => Prescription, :foreign_key => :prescriber_id
  accepts_nested_attributes_for :address, :reject_if => :all_blank

  def name
    name = ""
    name += title + " " if title
    name += given_name + " " if given_name
    name += family_name
    name
  end

  def self.search(search)
    if search
      where('people.family_name LIKE :q or people.given_name LIKE :q or addresses.street LIKE :q or addresses.city LIKE :q or addresses.state LIKE :q OR addresses.postal_code LIKE :q', :q => "%#{search}%").includes(:address)
    else
      find(:all)
    end
  end

end
