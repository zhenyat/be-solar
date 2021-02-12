module Zt
  ##############################################################################
  #   18.11.2016  ZT
  #   09.01.2017  Updated (folowing the RoR guide) *set_locale*
  #               *default_url_options* added
  #   15.11.2020  No classic autoloader: Zeitwerk only! 
  ##############################################################################

  ##############################################################################
  # Adds multiple url options (*locale* here).
  #
  # An alternative solution: *polymorphic* urls (e.g. redirect_to polymorphic_url)
  ##############################################################################
  def default_url_options
    { locale: I18n.locale }
    # { locale: I18n.locale, api_host: 'http://localhost:3001/' }
  end

  ##############################################################################
  #   Sets locale  before_action
  #   Called by:   application_controller.rb & sessions_controller.rb
  ##############################################################################
  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end
end
