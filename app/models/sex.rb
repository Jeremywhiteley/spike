class Sex < ActiveRecord::Base
  attr_accessible :code, :display_name, :original_text, :code_system, :code_system_name
end
