require "spec_helper"

RSpec.describe Mischief do
  it "has a version number" do
    expect(Mischief::VERSION).not_to be nil
  end

  describe ".reset" do
    before :each do
      Mischief.configure do |config|
       config.duration = 10
      end
    end

    it "resets the configuration" do
      Mischief.reset

      config = Mischief.configuration

      expect(config.duration).to eq(60)
    end
  end

  describe "#configure" do
    before :each do
      Mischief.configure do |config|
       config.duration = 10
      end
    end

    it "returns site taking 10ms" do
      stub_request(:get, "https://github.com").
        to_return(status: 200)
      ping = Mischief::Site.new.ping

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
