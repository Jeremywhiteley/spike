class Search
  include ActiveModel::Validations
  include ActiveModel::Conversion

  attr_accessor :given, :family

  def initialize(attributes = {})
    attributes.each { |name, value| send("#{name}=", value) } if attributes
  end

  def persisted?()    false  end
  def new_record?()   true   end

end
