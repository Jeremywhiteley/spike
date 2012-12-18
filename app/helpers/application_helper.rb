
module ApplicationHelper
  def state_codes
    Carmen::Country.named('United States').subregions.collect{|s|s.code}
  end
end
