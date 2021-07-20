require_relative "board.rb" 
require_relative "human.player.rb"

class Game

    def initialize(player_1_mark, player_2_mark)
    
       @board = Board.new
       @player_1 = Human.new(player_1_mark)
       @player_2 = Human.new(player_2_mark)
       @current_player = @player_1

     end

     def switch_turn
        if @current_player == @player_1
            @current_player = @player_2
        else
            @current_player = @player_1
        end

     end 

     def play
        
        while @board.empty_positions?
            @board.print
        
            @board.place_mark(@current_player.get_position, @current_player.mark)

            if @board.win?(@current_player.mark)
                puts "Player #{@current_player.mark} wins!"
                return
            else
                self.switch_turn
            end
        end
        puts "draw"
    end

end