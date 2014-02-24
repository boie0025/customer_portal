require 'customer_portal/version'
require 'locomotive/plugin'
require 'active_model' # Fix Locomotive::Plugin::ActiveModel namespacing.

module CustomerPortal
  class Base
    include Locomotive::Plugin

    before_page_render :authenticate

    require 'customer_portal/authentication'
    require 'customer_portal/user'
  end
end
