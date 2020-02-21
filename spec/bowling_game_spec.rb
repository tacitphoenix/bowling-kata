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
      2.times { bg.hit(3) }
      bg.hit(4)
      expect(bg.score).to eq 20
    end

    it "sums two spares" do
      bg = BowlingGame.new
      bg.hit(7)
      2.times { bg.hit(3) }
      bg.hit(7)
      2.times { bg.hit(4) }
      expect(bg.score).to eq 35
    end

    it "sums all spares" do
      bg = BowlingGame.new
      20.times{ bg.hit(5)}
      expect(bg.score).to eq 150
    end
  end

  context "with strikes" do
    it "sums one strike" do
      bg = BowlingGame.new
      bg.hit(10)
      bg.hit(3)
      bg.hit(4)
      expect(bg.score).to eq 24
    end

    it "sums two strikes" do
      bg = BowlingGame.new
      2.times { bg.hit(10) }
      2.times { bg.hit(4) }
      expect(bg.score).to eq 50
    end

    it "sums all strikes" do
      bg = BowlingGame.new
      10.times { bg.hit(10) }
      expect(bg.score).to eq 300
    end
  end

  context "with spares and strikes" do
    it "mix of 1 spare and strike" do
      bg = BowlingGame.new
      bg.hit(10)
      2.times { bg.hit(5) }
      2.times { bg.hit(3) }
      expect(bg.score).to eq 39
    end

    it "mix of 2 spare and strike" do
      bg = BowlingGame.new
      2.times { bg.hit(5) }
      2.times { bg.hit(10) }
      2.times { bg.hit(5) }
      2.times { bg.hit(3) }
      expect(bg.score).to eq 84
    end

    it "mix of spares and strikes" do
      bg = BowlingGame.new
      2.times { bg.hit(3) }
      4.times { bg.hit(5) }
      3.times { bg.hit(10) }
      4.times { bg.hit(4) }
      2.times { bg.hit(5) }
      2.times { bg.hit(10) }
      bg.hit(5)
      expect(bg.score).to eq 174
    end
  end
end
