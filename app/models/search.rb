class Search
  include ActiveModel::Validations
  include ActiveModel::Conversion

  attr_accessor :given, :family, :gender, :loc, :dob, :attributes_provided
  alias_method :attributes_provided?, :attributes_provided

  def initialize(attributes = {})
    attributes.each do |name, value|
      begin
        send("#{name}=", value)
        self.attributes_provided = true
      rescue NoMethodError
      end
    end
  end

  def persisted?()    false  end
  def new_record?()   true   end

end
