require "customer_portal/version"

module CustomerPortal
  include Locomotive::Plugin

  before_page_render :authenticate

  require_relative './customer_portal/authentication'
  require_relative './customer_portal/user'
end
