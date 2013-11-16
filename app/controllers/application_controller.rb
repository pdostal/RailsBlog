class ApplicationController < ActionController::Base
  before_action :set_locale
  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
    logger.debug "* Accept-Language: #{request.env['HTTP_ACCEPT_LANGUAGE']}"
    I18n.locale = extract_locale_from_accept_language_header
    logger.debug "* Locale set to '#{I18n.locale}'"
  end
private
def extract_locale_from_accept_language_header
  request.env['HTTP_ACCEPT_LANGUAGE'].scan(/^[a-z]{2}/).first
end
  #def default_url_options(options={})
    #logger.debug "default_url_options is passed options: #{options.inspect}\n"
    #{ locale: I18n.locale }
  #end
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
end
