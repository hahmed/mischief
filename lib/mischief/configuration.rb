module Mischief
  class Configuration
    attr_accessor :duration

    def site_name=(site_name)
      @site_name = scrub_url(site_name)
    end

    def site_name
      @site_name
    end

    def initialize
      @site_name = "https://github.com"
      @duration = 60
    end

    private

      def scrub_url(url)
        raise StandardError, "Bad Url" and return unless url =~ /\A#{URI::regexp}\z/
        url
      rescue URI::BadURIError
        raise StandardError, "Bad Url"
      rescue URI::InvalidURIError
        raise StandardError, "Bad Url"
      end
  end
end
