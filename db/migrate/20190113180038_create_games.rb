class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :game_desc
      t.integer :score
      t.string :winner
      t.string :loser
      t.integer :player_one_id
      t.integer :player_two_id
      t.string :state

      t.timestamps null: false
    end
  end
end
