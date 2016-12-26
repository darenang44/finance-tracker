class User::RegistrationsController < Devise::RegistrationsController
  before_filter :configure_permitted_parameters

  # def configure_permitted_parameters
  #   # we are customizing devise to take in first_name and last_name for the sign_up path and to update user info
  #   devise_parameter_sanitizer.for(:sign_up).push(:first_name, :last_name)
  #   devise_parameter_sanitizer.for(:account_update).push(:first_name, :last_name)
  # end

  def configure_permitted_parameters
    # we are customizing devise to take in first_name and last_name for the sign_up path and to update user info
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name])
  end

end
