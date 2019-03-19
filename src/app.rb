require_relative "view/ruby2d"
require_relative "model/state"
require_relative "actions/actions"

class App

    def initialize
        @state = Model::initial_state
    end

    def start
        @view = View::Ruby2dView.new(self)
        initial_state = Model::initial_state
        Thread.new{
            init_timer(@view)
        }
        @view.start(@state)    
    end

    def init_timer(view)
        loop do
            # trigger movement 
            @state = Actions::move_snake(@state)
            view.render(@state)
            sleep 0.5
        end
    end

    def send_action(action,params)
        new_state = Actions.send(action,@state,params)
        if new_state.hash != @state.hash
            @state = new_state
            @view.render(@state)
        end
    end
end

app = App.new
app.start