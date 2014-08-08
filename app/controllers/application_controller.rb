class ApplicationController < ActionController::Base
  include Monban::ControllerHelpers

  protect_from_forgery with: :exception

  def verify_admin
    if !current_user.admin?
      redirect_to root_path
    end
  end

  def current_user
    super || NullUser.new
  end
end
