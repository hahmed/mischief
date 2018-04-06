require 'net/http'
require 'benchmark'

module Mischief
  class Site
    def ping
      site = Mischief.configuration.site_name
      calculate_requests
      # "#{site} took #{average_response}ms #{emoji(average_response)}"
    end

    def calculate_requests
      end_time = Time.now + Mischief.configuration.duration
      total_request_time = 0
      total_request_time += Benchmark.realtime do
        request
      end
      total_request_time.round(4)
    end

    def emoji(average_response)
      case average_response
      when 0..0.2
        "💪"
      when 0.3..1
        "🤔"
      else
        "👎"
      end
    end

    private

      def request
        response = Net::HTTP.get_response(URI.parse(Mischief.configuration.site_name))
        raise 'ResponseFailed' unless success_code?(response.code)
      rescue Timeout::Error, Errno::EINVAL, Errno::ECONNRESET, EOFError,
             Net::HTTPBadResponse, Net::HTTPHeaderSyntaxError, Net::ProtocolError
        raise 'RequestFailed'
      end

      def success_code?(code)
        case code.to_i
        when 400..599 # all 4xx and 5xx fails
          # puts "Request ##{@number_of_requests} failed with status #{code}"
          return false
        else
          # puts "Request ##{@number_of_requests} succeeded with status #{code}"
          return true
        end
      end
  end
end
