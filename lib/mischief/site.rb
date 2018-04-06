require 'net/http'
require 'benchmark'

module Mischief
  class Site
    def ping
      site = Mischief.configuration.site_name
      calculate_requests
    end

    # def status
    #   config = Mischief.configuration
    #   average_response = ping
    #   "#{config.site_name} took #{average_response}ms from #{config.number_of_requests} requests #{emoji(average_response)}"
    # end

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

      def calculate_requests
        total_request_time, count = 0, 0

        while count < Mischief.configuration.number_of_requests do
          count +=1
          total_request_time += Benchmark.realtime { request }
        end
        total_request_time.round(4)
      end

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
          return false
        else
          return true
        end
      end
  end
end
