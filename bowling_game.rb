require_relative 'frame'

class BowlingGame
    attr_reader :frames, :current_frame
    def initialize
        @frames = []
        @current_frame = Frame.new
    end

    def hit(pins)
        @current_frame.hit(pins)
        if @current_frame.complete?
            @frames << @current_frame
            @current_frame = Frame.new
        end
    end

    def score
        @frames.map(&:score).sum
    end
end
