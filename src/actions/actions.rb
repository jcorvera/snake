module Actions
    def self.move_snake(state)
        next_direction = state.next_direction
        next_position = calc_next_position(state)
        # vwrificar que la siguiente casilla sea valida
        if position_is_valid?(state,next_position)
            move_skane_to(state,next_position)
        else
            end_game(state)
        end
    end
    private 
    def calc_next_position(state)
        new_positions = state.snake.positions.first
        case state.next_direction
        when UP
            #decrementar la fila
            return Model::Coord.new(new_positions.rows - 1,new_positions.cols);            
        when RIGHT
            #incrementar la col
            return Model::Coord.new(new_positions.rows,new_positions.cols + 1);
        when DOWN
            #incrementar la fila
            return Model::Coord.new(new_positions.rows + 1,new_positions.cols);
        when LEFT
            #decrementar la col
            return Model::Coord.new(new_positions.rows,new_positions.cols - 1);
        end
    end

    def position_is_valid(state, position)
        # verificar que este en la grilla
        if position.rows < state.grid.rows && position.rows >= 0
            
        end
        # 
    end
end