class ApplicationController < ActionController::Base
  include Pundit

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:email])
  end

  private

  def authorization(record)
    authorize record
    verify_authorized
  end

  def user_not_authorized
    flash[:danger] = 'You are not authorized to perform this action.'
    redirect_to(request.referer || root_path)
  end
end
