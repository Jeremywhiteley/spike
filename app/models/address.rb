class Address < ActiveRecord::Base
  attr_accessible :city, :postal_code, :state, :street

  def to_s
    # street, city, and state are separated by commas
    s = [street, city, state].select{|f| f.present?}.join ", "

    # zip is separated by a space
    [s, postal_code].select{|f| f.present?}.join " "
  end

end
