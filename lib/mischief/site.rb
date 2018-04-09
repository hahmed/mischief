require 'net/http'
require 'benchmark'

module Mischief
  class Site
    def ping
      config = Mischief.configuration
      result = calculate_requests(config.number_of_requests)
      request = config.number_of_requests > 1 ? "requests" : "request"
      "#{config.site_name} (#{config.number_of_requests} #{request}) took #{result} seconds #{emoji(result, config.number_of_requests)}"
    end

    private

      def calculate_requests(number_of_requests)
        total_request_time, count = 0, 0

        while count < number_of_requests do
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

      def emoji(average_response, number_of_requests)
        case average_response / number_of_requests.to_f
        when 0...0.7
          "💪"
        when 0.7...1.3
          "🤔"
        else
          "👎"
        end
      end
  end
end
