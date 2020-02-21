require 'spec_helper'

RSpec.describe BowlingGame, "#score" do
  context "with no strikes or spares" do
    it "sums the pin count for each roll" do
      bg = BowlingGame.new
      20.times { bg.hit(4) }
      expect(bg.score).to eq 80
    end
  end

  context "with spares" do
    it "sums one spare" do
      bg = BowlingGame.new
      bg.hit(7)
      bg.hit(3)
      bg.hit(3)
      bg.hit(4)
      expect(bg.score).to eq 20
    end
  end
end
