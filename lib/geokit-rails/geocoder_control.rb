require 'active_support/concern'

module Geokit
  module GeocoderControl
    extend ActiveSupport::Concern
  
    included do
      if self.respond_to? :before_action
        self.send :before_action, :set_geokit_domain
      elsif self.respond_to? :before_filter
        self.send :before_filter, :set_geokit_domain
      end
    end
    
    def set_geokit_domain
      Geokit::Geocoders::domain = request.domain
    end
  end
end
