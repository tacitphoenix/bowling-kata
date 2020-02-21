class Frame
    attr_reader :top, :bottom, :id

    def initialize(id)
        @id = id
    end

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

    def bonus
        case 
        when @top == 10
            :strike
        when score == 10 
            :spare
        else
            :none
        end
    end
end