module DeviseWhitelist
  extend ActiveSupport::Concern

  included do
    before_action :configure_perrmitted_parameters, if: :devise_controller? 
  end

  def configure_perrmitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end
end
