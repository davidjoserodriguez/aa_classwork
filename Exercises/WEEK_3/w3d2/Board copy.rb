require "byebug"
require_relative "Card.rb"

class Board 
    

    def initialize(size)
        @board = Array.new(size) { Array.new(size, " ")}
        # @card = Card.new(face_value, face_up)
    end 

    def populate
        new_cards = Card.new_cards(@board.length)
        (0...@board.length).each do |row|
             (0...@board.length).each do |col|
                @board[row][col] = new_cards.shift 
             end 
        end 
        @board
    end 

    def render
        @board.each do |row|
            puts row.join(" ")
        end
    end


    def won?
        (0...@board.length).each do |row|
            (0...@board.length).each do |col|
               if !@board[row][col].reveal
                return false
               end
            end 
        end
        return true
    end

    def reveal(guessed_pos)
        row, col = guessed_pos
        
        if !@board[row][col].face_up
            @board[row][col] = @board[row][col].face_value self.populate[row][col].face_value
        end
        return self.populate[row][col].face_value
    end




end 