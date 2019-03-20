module Actions
    def self.move_snake(state)
        next_direction = state.curr_direction
        next_position = calc_next_position(state)
        # vwrificar que la siguiente casilla sea valida
        if position_is_food?(state,next_position)
            state = grow_skane_to(state,next_position)
            generated_food(state)
        elsif position_is_valid?(state,next_position)
            move_skane_to(state,next_position)
        else
            end_game(state)
        end
    end
    private 
    def self.generated_food(state)
        #rand
        new_food = Model::Food.new(rand(state.grid.rows),rand(state.grid.cols))
        state.food = new_food
        state                
    end

    def self.position_is_food?(state,next_position)
        state.food.rows == next_position.rows && state.food.cols == next_position.cols
    end

    def self.grow_skane_to(state,next_position)
        new_positions = [next_position] + state.snake.positions
        state.snake.positions = new_positions
        state
    end

    def self.calc_next_position(state)
        new_positions = state.snake.positions.first
        case state.curr_direction
        when Model::Direction::UP
            #decrementar la fila
            return Model::Coord.new(new_positions.rows - 1,new_positions.cols);            
        when Model::Direction::RIGHT
            #incrementar la col
            return Model::Coord.new(new_positions.rows,new_positions.cols + 1);
        when Model::Direction::DOWN
            #incrementar la fila
            return Model::Coord.new(new_positions.rows + 1,new_positions.cols);
        when Model::Direction::LEFT
            #decrementar la col
            return Model::Coord.new(new_positions.rows,new_positions.cols - 1);
        end
    end

    def self.position_is_valid?(state, position)
        # verificar que este en la grilla
        is_valid = (position.rows >= state.grid.rows || position.rows < 0 ||
         (position.cols >= state.grid.cols || position.cols < 0))
        return false if is_valid
        return !(state.snake.positions.include? position)
        # 
    end

    def self.move_skane_to(state, next_position)
        new_positions = [next_position] + state.snake.positions[0...-1]
        state.snake.positions = new_positions
        state
    end

    def self.end_game(state)
        state.game_finished = true
        state
    end

    def self.change_direction(state, direction)
        if next_direction_is_valid?(state,direction)
            state.curr_direction = direction
        else
            pust "Invalid Direction"
        end
        state
    end

    def self.next_direction_is_valid?(state,direction)
        case state.curr_direction
        when Model::Direction::UP
            return true if direction != Model::Direction::DOWN
        when Model::Direction::DOWN
            return true if direction != Model::Direction::UP
        when Model::Direction::LEFT
            return true if direction != Model::Direction::RIGHT
        when Model::Direction::RIGHT
            return true if direction != Model::Direction::LEFT
        end
        return false
    end
end