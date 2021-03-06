class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :set_locale
  before_action :newsletter

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def newsletter
    @newsletter = Newsletter.new
  end

  def default_url_options(options = {})
    { locale: I18n.locale }.merge options
  end
end
