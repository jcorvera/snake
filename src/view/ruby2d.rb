require "ruby2d"
module View
    class Ruby2dView
        
        def initialize(app)
            @pizel_size = 50;
            @app = app
        end

        def start(state)
            extend Ruby2D::DSL
            set(
                title: "Snake", 
                width:@pizel_size * state.grid.cols,
                height:@pizel_size * state.grid.rows
            )
            on :key_down do |event|
                handle_key_event(event)
                puts event.key
            end
            show
        end 

        def render(state)
            render_snake(state)
            render_food(state)
        end
        
        private
        def render_food(state)
            @food.remove if @food
            extend Ruby2D::DSL
            food = state.food
            @food = Square.new(
                x: food.cols * @pizel_size,
                y: food.rows * @pizel_size,
                size: @pizel_size,
                color: 'yellow'
            )
        end 

        def render_snake(state)
            @snake_positions.each(&:remove) if @snake_positions
            extend Ruby2D::DSL
            snake = state.snake
            @snake_positions = snake.positions.map do |pos|   
                Square.new(
                    x: pos.cols * @pizel_size,
                    y: pos.rows * @pizel_size,
                    size: @pizel_size,
                    color: 'blue'
                )
            end

        end

        def handle_key_event(event)
            case event.key
            when "up"
                @app.send_action(:change_direction,Model::Direction::UP)
            when "down"
                @app.send_action(:change_direction,Model::Direction::DOWN)
            when "left"
                @app.send_action(:change_direction,Model::Direction::LEFT)
            when "right"
                @app.send_action(:change_direction,Model::Direction::RIGHT)
            end
        end
    end
end