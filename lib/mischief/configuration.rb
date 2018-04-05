module Mischief
  class Configuration
    attr_accessor :site_name
    attr_accessor :duration

    def initialize
      @site_name = "https://github.com"
      @duration = 60
    end
  end
end
