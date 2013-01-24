require 'date'

class Person < ActiveRecord::Base
  validates :family_name, :presence => true
  validates :sex_id, :presence => true
  attr_accessible :title, :given_name, :family_name, :sex_id, :birthdate, :address_id, :address_attributes
  belongs_to :sex
  belongs_to :address
  has_many :prescriptions_received, :class_name => Prescription, :foreign_key => :patient_id
  has_many :prescriptions_written, :class_name => Prescription, :foreign_key => :prescriber_id
  has_many :prescriptions_fulfilled, :class_name => Fulfillment, :foreign_key => :pharmacist_id
  accepts_nested_attributes_for :address, :reject_if => :all_blank

  def name
    [title, given_name, family_name].select{|f| f.present?}.join " "
  end

  def self.search(search)
    if search
      where('people.family_name LIKE :q or people.given_name LIKE :q or addresses.street LIKE :q or addresses.city LIKE :q or addresses.state LIKE :q OR addresses.postal_code LIKE :q', :q => "%#{search}%").includes(:address)
    else
      find(:all)
    end
  end

  # expects a populated Search model
  def self.advanced_search(params)
    return [] unless params

    query_terms = []
    query_params = {}

    if params.given.present?
      query_terms << "people.given_name = :given"
      query_params[:given] = params.given
    end
    if params.family.present?
      query_terms << "people.family_name = :family"
      query_params[:family] = params.family
    end
    if params.gender.present?
      sex = Sex.find_by_display_name(params.gender.capitalize)
      query_terms << "people.sex_id = :sex"
      query_params[:sex] = sex.id
    end
    if params.loc.present?
      query_terms << "(addresses.street LIKE :loc or addresses.city LIKE :loc or addresses.state LIKE :loc OR addresses.postal_code LIKE :loc)"
      query_params[:loc] = "%#{params.loc}%"
    end
    if params.dob.present?
      # if the parameter is a String it needs to be parsed to a Date
      dob = params.dob.class == String && Date.parse(params.dob) || params.dob
      query_terms << "people.birthdate = :dob"
      query_params[:dob] = dob
    end

    query_params.present? and where(query_terms.join(" AND "), query_params).includes(:address)
  end

end
