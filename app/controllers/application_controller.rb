class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  	before_filter :configure_permitted_parameters, if: :devise_controller?


  	#This is used to send more permitted parameters when creating a sign on - allows these extra ones for the devise login stuff
    def configure_permitted_parameters
    	devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:first_name, :surname, :email, :workgroup, :role_id, :job_grade, :location, :team, :admin, :password, :password_confirmation) }
    	devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:first_name, :surname, :email, :workgroup, :password, :remember_me) }
    	devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:first_name, :surname, :email, :workgroup, :role_id, :job_grade, :location, :team, :admin, :password, :password_confirmation, :current_password) }
	end
end
