class Admin::AdminController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :set_locale
  before_action :authenticate_user!
  before_action :is_admin?

  layout "admin"

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def is_admin?
    redirect_to root_url, flash: {error: t('admin.not_enough_right')} if current_user.role != "admin"
  end
end
