require "application_responder"
class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.


  before_action :authenticate_http_basic, if: :http_basic_auth_site?

  before_action :set_locale
  before_action :set_return_url
  self.responder = ApplicationResponder
  protect_from_forgery with: :exception
  respond_to :html




  private

  def authenticate_http_basic
      authenticate_or_request_with_http_basic do |username, password|
        username == Rails.application.secrets.http_basic_username && password == Rails.application.secrets.http_basic_password
      end
    end

    def http_basic_auth_site?
      Rails.application.secrets.http_basic_auth
    end

    def verify_lock
      if current_user.locked?
        redirect_to account_path, alert: t('verification.alert.lock')
      end
    end

    def set_locale
      if params[:locale] && I18n.available_locales.include?(params[:locale].to_sym)
        session[:locale] = params[:locale]
      end

      session[:locale] ||= I18n.default_locale

      locale = session[:locale]

      if current_user && current_user.locale != locale.to_s
        current_user.update(locale: locale)
      end

      I18n.locale = locale
    end

    def set_layout
      if devise_controller?
        "devise"
      else
        "application"
      end
    end
    def set_return_url
      if !devise_controller? && controller_name != 'welcome' && is_navigational_format?
        store_location_for(:user, request.path)
      end
    end

    def set_page_params
      params[:per_page_list] ||= [10,20,30,40,50]
      params[:per_page] ||= 20
    end
end
