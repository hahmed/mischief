require "spec_helper"

RSpec.describe Mischief do
  it "has a version number" do
    expect(Mischief::VERSION).not_to be nil
  end

  describe ".reset" do
    before :each do
      Mischief.configure do |config|
       config.number_of_requests = 5
       config.site_name = "https://google.com"
      end
    end

    it "resets the configuration" do
      Mischief.reset

      config = Mischief.configuration

      expect(config.site_name).to eq("https://github.com")
      expect(config.number_of_requests).to eq(10)
    end
  end

  describe "#configure" do
    before :each do
      Mischief.configure do |config|
       config.number_of_requests = 3
       config.site_name = "https://google.com"
      end
    end

    it "returns average response for site based on 3 requests" do
      stub_request(:get, "https://google.com").
        to_return(status: 200)
      ping = Mischief::Site.new.ping
      config = Mischief.configuration

      expect(config.site_name).to eq("https://google.com")
      expect(config.number_of_requests).to eq(3)

      expect(ping).to be_a(Float)
      expect(ping).to be < 1
      # expect(ping).to eq("https://github.com took 60ms 👎")
      # expect(ping).to eq("https://github.com took 10ms 💪")
    end

    after :each do
      Mischief.reset
    end
  end
end
