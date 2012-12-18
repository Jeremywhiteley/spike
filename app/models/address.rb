class Address < ActiveRecord::Base
  attr_accessible :city, :postal_code, :state, :street

  def to_s
    s = ""
    s += street + ", " if street.present?
    s += city + ", " if city.present?
    s += state + " " if state.present?
    s += postal_code if postal_code.present?
    s
  end

end
