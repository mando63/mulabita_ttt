class CreateGamePlayers < ActiveRecord::Migration
  def change
    create_table :game_players do |t|
      t.string :player_name
      t.string :player_email
      t.string :player_alias
      t.integer :won
      t.integer :lost
      t.integer :drawn

      t.timestamps null: false
    end
  end
end
