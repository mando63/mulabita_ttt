module Grid
  class GridPlay
    @player_one_plays = []
    @player_two_plays = []

    WINNING_COMBINATIONS = [
      [1, 2, 3],
      [4, 5, 6],
      [7, 8, 9],
      [1, 4, 7],
      [2, 5, 8],
      [3, 6, 9],
      [1, 5, 9],
      [3, 5, 7],
   ]

    def initilize()
      @play_position = []
      9.times.each { |idex| @play_position << index + 1}
      populate_grid
    end

    def draw_grid
      begin
        @grid.each do |column|
          raise StandardError, "Oops Unable to draw the board try again later!!" unless @grid[column].is_a? Array
          @grind[column].each do |row|
            puts row
          end
      rescue StandardError => e
        puts e.message
      end
    end

    def player_one_play
      puts "Player one : #{player_1.name} make selection"
      player_selection = gets.chomp
      @player_1.selection << player_selection
      row_col = find_in_grid(player_selection)
      player_1.record_play(@game.id, row_col[:row], row_col[:column], "X")
    end

    def player_two_play
      puts "Player two : #{player_1.name} make selection"
      player_selection = gets.chomp
      @player_2.selection << player_selection
      row_col = find_in_grid(player_selection)
      player_2.record_play(@game.id, row_col[:row], row_col[:column], "O")
    end

    def play
      while true do
        begin
          selection = gets.chomp
          raise TypeError, "Invalid number selection out of range." unless (1..9).include? selection
          if @play_position.include? selection
            return selection
          else
            puts "Please select another option this number has been selected already"
            retry
          end
        rescue TypeError => e
           puts "That's not a number. Try again"
           retry ## restart from begin
        end
      end
    end

    def who_is_the_winner?
      message = if check_player(@player_1) == @player_1.name
          "Player #{@player_1.name} wins!!!" 
        elsif check_player(@player_2) == @player_2.name
          "Player #{@player_2.name} wins!!!"
        else
          "Game has ended in a tie!!!"
        end
    end

    def populate_grid
    @grid = []
    3.times.each do
        rows = []
        3.times.each do
          rows << @play_position.pop.to_s
      end
        @grid << rows
      end
    end

    def find_in_grid(selection)
      @grid.each do |column|
        column_index = @grid.index(column)
        @grid[column].each do |row_value|
          row_index = @grid[column].index(row_value)
          if(row_value == selection)
            {:row => column_index, :column => row_index }
          end
        end
        3.times.each do
          @grid
        end
      end
    end
  end
end