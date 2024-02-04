class ApplicationController < ActionController::Base
  before_action :set_theme
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end


  private
  def set_theme
    cookies[:theme] ||= 'dark'
    cookies[:theme] = params[:theme] if params[:theme].in? %w[dark light]
  end
end
