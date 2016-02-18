class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :get_current_phone

  def get_current_phone
    if cookies.signed.permanent[:phone_number].present?
      @current_phone ||= Phone.where(number: cookies.signed[:phone_number]).first
    else
      redirect_to new_phone_path
    end
  end
end
