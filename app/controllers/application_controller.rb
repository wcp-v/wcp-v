class ApplicationController < ActionController::Base
before_action :configure_permitted_parameters, if: :devise_controller?

  # def authenticate_any!
  #   if  admin_signed_in?
  #     true
  #   else
  #     authenticate_customer!
  #   end
  # end

 def after_sign_in_path_for(resource)
  if resource_name == :admin
     admin_root_path
  elsif resource_name == :customer
     root_path
  end
 end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name, :last_name_kana, :first_name_kana, :postcode, :address, :telephone_number, :email, :encrypted_password])
  end
end
