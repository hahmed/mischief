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
