require 'spec_helper'

RSpec.describe BowlingGame, "#score" do
  context "with no strikes or spares" do
    it "sums the pin count for each roll" do
      bg = BowlingGame.new
      20.times { bg.hit(4) }
      expect(bg.score).to eq 80
    end
  end
end
