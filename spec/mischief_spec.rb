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

    it "default configuration is correct" do
      config = Mischief.configuration

      expect(config.site_name).to eq("https://google.com")
      expect(config.number_of_requests).to eq(3)
    end

    after :each do
      Mischief.reset
    end
  end
end
