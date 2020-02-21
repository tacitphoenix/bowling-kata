class Frame
    attr_reader :top, :bottom

    def hit(pins)
        if @top
            @bottom = pins
        else
            @top = pins
        end
    end

    def score
        @top + @bottom if complete?
    end

    def complete?
        @top && @bottom
    end
end