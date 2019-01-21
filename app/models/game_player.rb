class GamePlayer < ActiveRecord::Base
  # this model stores details of a user playing a game
  attr_accessor :game_selections, :winner
  has_many :caper

  def game_selections
    @game_selections ||= []
  end

  def record_play(game_id, cell_row,cell_column, cell_state)
    Caper.create!(
      game_id: game_id,
      player_id: self.id,
      cell_row: cell_row,
      cell_column: cell_column,
      cell_state: cell_state
    )
  end

  def has_won?(winner)
    @winner = winner
  end
end
