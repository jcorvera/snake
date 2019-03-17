require "ruby2d"
module View
    class Ruby2dView
        def initialize
            @pizel_size = 50;
        end
        def render(state)
            extend Ruby2D::DSL
            set(
                title: "Snake", 
                width:@pizel_size * state.grid.cols,
                height:@pizel_size * state.grid.rows
            )
            render_snake(state)
            render_food(state)
            show
        end
        private


        def render_food(state)
            extend Ruby2D::DSL
            food = state.food
            Square.new(
                x: food.cols * @pizel_size,
                y: food.rows * @pizel_size,
                size: @pizel_size,
                color: 'yellow'

            )
        end 

        def render_snake(state)
            extend Ruby2D::DSL
            snake = state.snake
            snake.positions.each do |pos|   
                Square.new(
                    x: pos.cols * @pizel_size,
                    y: pos.rows * @pizel_size,
                    size: @pizel_size,
                    color: 'blue'

                )
            end

        end
    end
end