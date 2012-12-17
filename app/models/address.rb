class Address < ActiveRecord::Base
  attr_accessible :city, :postal_code, :state, :street
end
