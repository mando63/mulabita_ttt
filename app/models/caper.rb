class Caper < ActiveRecord::Base
  # this model stores the details for individual plays made my a game player
  belongs_to :game_player
end
