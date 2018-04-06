require 'spec_helper'

module Mischief
  RSpec.describe Site do
    describe "#ping" do
      let (:ping) { Mischief::Site.new.ping }

      it "result is a float" do
        stub_request(:get, "https://github.com").
          to_return(status: 200)

        expect(ping).to be_a(Float)
        expect(ping).to be < 1
      end

      it "returns average response" do
        stub_request(:get, "https://github.com").
          to_return(status: 200)

        expect(ping).to be < 1
      end
    end

    describe "#emoji" do
      let (:site) { Mischief::Site.new }

      it "returns emoji 👎 if response too high" do
        expect(site.emoji(5)).to eq("👎")
      end

      it "returns emoji 🤔 if response is average" do
        expect(site.emoji(1)).to eq("🤔")
      end

      it "returns emoji 💪 if response is amazing" do
        expect(site.emoji(0.02)).to eq("💪")
      end
    end
  end
end
