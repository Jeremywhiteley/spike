class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authenticate_user!
  after_filter :add_access_control_headers
  layout Proc.new { |c| c.user_signed_in? ? "auth" : "unauth" }

  private

  def add_access_control_headers
    headers["Access-Control-Allow-Origin"] = "*"
    headers["Access-Control-Request-Method"] = "*"
  end

end
