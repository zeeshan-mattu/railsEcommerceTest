class ApplicationController < ActionController::Base
  include ApplicationHelper

  before_action :configure_permitted_parameters,

  # include Pundit::Authorization

  if: :devise_controller?
    protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:avatar])
      devise_parameter_sanitizer.permit(:account_update, keys: [:avatar])
    end

end
