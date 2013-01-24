class Pharmacy < ActiveRecord::Base
  attr_accessible :address_id, :name, :phone
  belongs_to :address
end
