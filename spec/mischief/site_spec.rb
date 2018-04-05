require 'spec_helper'

module Mischief
  RSpec.describe Site do
    describe "#ping" do
      let (:ping) { Mischief::Site.new.ping }

      it "result is a string" do
        expect(ping).to be_a(String)
      end

      it "returns average response" do
        expect(ping).to eq("https://github.com took 14ms 💪‍")
      end
    end

    describe "#emoji" do
      let (:site) { Mischief::Site.new }

      it "returns emoji 👎 if response too high" do
        expect(site.emoji(100)).to eq("👎")
      end

      it "returns emoji 🤔 if response is average" do
        expect(site.emoji(30)).to eq("🤔")
      end

      it "returns emoji 💪 if response is amazing" do
        expect(site.emoji(7)).to eq("💪‍")
      end
    end
  end
end
