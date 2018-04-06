module Mischief
  class Configuration
    attr_accessor :number_of_requests

    def site_name=(site_name)
      @site_name = scrub_url(site_name)
    end

    def site_name
      @site_name
    end

    def initialize
      @site_name = "https://github.com"
      @number_of_requests = 10
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
