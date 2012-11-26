class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authenticate_user!
  layout Proc.new { |c| c.user_signed_in? ? "auth" : "unauth" }
end
