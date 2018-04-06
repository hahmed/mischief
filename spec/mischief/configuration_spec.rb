require 'spec_helper'

module Mischief
  RSpec.describe Configuration do
    describe "#site_name" do
      it "default site is GitHub" do
        Configuration.new.site_name = "https://github.com"
      end
    end

    describe "#site_name=" do
      it "can set value" do
        config = Configuration.new
        config.site_name = "https://i.amharoon.com"
        expect(config.site_name).to eq("https://i.amharoon.com")
      end

      it "invalid url throws error for something" do
        config = Configuration.new
        expect { config.site_name = "something" }.to raise_error(StandardError, "Bad Url")
      end

      it "invalid url throws error for something." do
        config = Configuration.new
        expect { config.site_name = "something." }.to raise_error(StandardError, "Bad Url")
      end

      it "invalid url throws for github.com because host is not found" do
        config = Configuration.new
        expect { config.site_name = "github.com" }.to raise_error(StandardError, "Bad Url")
      end

      it "valid url http://github.com" do
        config = Configuration.new
        config.site_name = "http://github.com"
        expect(config.site_name).to eq("http://github.com")
      end

      it "valid url http://google.co.uk" do
        config = Configuration.new
        config.site_name = "http://google.co.uk"
        expect(config.site_name).to eq("http://google.co.uk")
      end
    end

    describe "#duration" do
      it "default duration is 60" do
        Configuration.new.duration = 60
      end
    end

    describe "#duration=" do
      it "can set value" do
        config = Configuration.new
        config.duration = 7
        expect(config.duration).to eq(7)
      end
    end
  end
end
