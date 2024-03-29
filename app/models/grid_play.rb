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

    def initilize
      @play_position = []
      9.times.each { |index| @play_position << index + 1}
      repopulate_grid
      @game_in_session = true
    end

    def play
      while @game_in_session
        draw_grid
        return unless check_player(@game_in_session)
        player_one_play
        return unless @game_in_session
        player_two_play
      end

    end

    def draw_grid
      begin
        @grid.each do |column|
          raise StandardError, "Oops Unable to draw the board try again later!!" unless @grid[column].is_a? Array
          @grind[column].each do |row|
            puts row
          end
        end
      rescue StandardError => e
        puts e.message
      end
    end

    def player_one_play
      puts "Player one : #{player_1.name} make selection"
      @player_1.selection << select_option
      @play_position[select_option.to_i] = "X"
      row_col = find_in_grid(player_selection)
      player_1.record_play(@game.id, row_col[:row], row_col[:column], "X")
      check_player_score(@player_1)
    end

    def player_two_play
      puts "Player two : #{player_1.name} make selection"
      @player_2.selection << select_option
      @player_position[select_option.to_i] = "O"
      row_col = find_in_grid(player_selection)
      player_2.record_play(@game.id, row_col[:row], row_col[:column], "O")
      check_player_score(@player_2)
    end

    def select_option
      selection = ''
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
          ssretry ## restart from begin
        end
      end
      selection
    end

    def who_is_the_winner?
      message = if @player_1.winner
          "Player #{@player_1.name} wins!!!"
        elsif @player_2.winner
          "Player #{@player_2.name} wins!!!"
        else
          "Game has ended in a tie!!!"
        end
    end

    private

    def check_player_score(player)
      @game_in_session = true
      return @game_in_session if (player.game_selections.count < 3) #number of combinations to win a game have not been met therefore return false
      WINNING_COMBINATIONS.each do |combination|
        if combination == player.game_selections
          @game_in_session = false
          player.has_won?(true)
          break
        end
      end
      @game_in_session
    end

    def repopulate_grid
      temp = @play_position.dup
      @grid = []
      3.times.each do
          rows = []
          3.times.each do
            rows << temp.pop.to_s
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
      end
    end
  end
end