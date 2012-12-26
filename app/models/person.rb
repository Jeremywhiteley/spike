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
    [title, given_name, family_name].select{|f| f.present?}.join " "
  end

  def self.search(search)
    if search
      where('people.family_name LIKE :q or people.given_name LIKE :q or addresses.street LIKE :q or addresses.city LIKE :q or addresses.state LIKE :q OR addresses.postal_code LIKE :q', :q => "%#{search}%").includes(:address)
    else
      find(:all)
    end
  end

  def self.advanced_search(params)
    return [] unless params

    query_terms = []
    query_params = {}

    if params[:given].present?
      query_terms << "people.given_name = :given"
      query_params[:given] = params[:given]
    end
    if params[:family].present?
      query_terms << "people.family_name = :family"
      query_params[:family] = params[:family]
    end

    where(query_terms.join(" AND "), query_params)
  end

end
