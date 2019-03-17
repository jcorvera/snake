module Model
    # submodulo
    module Direction
        UP = :up
        RIGHT = : right
        DOWN = :down
        LEFT = :left 
    end

    class Coord < Struct.new(:rows,:cols)
    end
    
    class Food < Coord   
    end

    class Grid < Coord
    end

    class Snake < Struct.new(:positions)
    end 

    class State < Struct.new(:snake,:food,:grid,:next_direction)
    end

    def self.initial_state
        Model::State.new(
            Model::Snake.new([
                Model::Coord.new(1,1),
                Model::Coord.new(0,1)
            ]),
            Model::Food.new(4,4),
            Model::Grid.new(8,12),
            Direction::DOWN
        )
    end
    
end