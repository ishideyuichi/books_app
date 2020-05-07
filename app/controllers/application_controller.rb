class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit :sign_up, keys: [:name, :address, :introduction]
      devise_parameter_sanitizer.permit :account_update, keys: [:name, :address, :introduction ,:postcode]
    end
end
