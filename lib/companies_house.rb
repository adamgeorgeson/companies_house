require "httparty"
require 'active_support/core_ext/module/attribute_accessors'

# Wrapper for interacting with Companies House API
module CompanieHouse
  Dir[File.dirname(__FILE__) + '/companies_house/*.rb'].each do |file|
    require file
  end
end
