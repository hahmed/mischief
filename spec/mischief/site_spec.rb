require 'spec_helper'

module Mischief
  RSpec.describe Site do
    describe "#ping" do
      let (:site) { Mischief::Site.new }

      it "returns slow response with emoji 👎" do
        stub_request(:get, "https://github.com").
          to_return(status: 200)

        allow(site).to receive(:calculate_requests).and_return(2)
        expect(site.ping).to eq("https://github.com (10 requests) took 2ms 👎")
      end

      it "returns average response with emoji 🤔" do
        stub_request(:get, "https://github.com").
          to_return(status: 200)

        allow(site).to receive(:calculate_requests).and_return(0.5)
        expect(site.ping).to eq("https://github.com (10 requests) took 0.5ms 🤔")
      end

      it "returns fast response with emoji 💪" do
        stub_request(:get, "https://github.com").
          to_return(status: 200)

        allow(site).to receive(:calculate_requests).and_return(0.04)
        expect(site.ping).to eq("https://github.com (10 requests) took 0.04ms 💪")
      end

      it "returns response with request correctly un-pluralized" do
        stub_request(:get, "https://github.com").
          to_return(status: 200)

        Mischief.configuration.number_of_requests = 1
        allow(site).to receive(:calculate_requests).and_return(0.04)
        expect(site.ping).to eq("https://github.com (1 request) took 0.04ms 💪")
      end
    end
  end
end
