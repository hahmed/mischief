module Mischief
  class Site
    def ping
      site = Mischief.configuration.site_name
      average_response = Mischief.configuration.duration
      "#{site} took #{average_response}ms #{emoji(average_response)}"
    end

    def emoji(average_response)
      case average_response
      when 0..15
        "💪"
      when 16..40
        "🤔"
      else
        "👎"
      end
    end
  end
end
