require_relative 'frame'

class BowlingGame
    attr_reader :frames
    attr_accessor :current_frame

    def initialize
        @frames = []
        @current_frame = Frame.new(1)
    end

    def hit(pins)
        current_frame.hit(pins)
        if current_frame.complete?
            frames << current_frame
            self.current_frame = Frame.new(current_frame.id + 1)
        end
    end

    def score
        @frames.map do |frame|
            case frame.bonus
            when :strike
                if frames[frame.id].bonus == :strike
                    frame.score + frames[frame.id].score + frames[frame.id + 1].top
                else
                    frame.score + frames[frame.id].score
                end
            when :spare
                frame.score + frames[frame.id].top
            else
                frame.score
            end
        end.sum
    end
end
