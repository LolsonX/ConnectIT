class ApplicationController < ActionController::API
  include ActionController::MimeResponds
  around_action :switch_locale

  def switch_locale(&action)
    locale = params[:locale] || I18n.default_locale
    I18n.with_locale(locale, &action)
  end
  respond_to :json
end
