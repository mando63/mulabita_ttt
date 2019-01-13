class CreateCapers < ActiveRecord::Migration
  def change
    create_table :capers do |t|
      t.integer :game_id
      t.integer :player_id
      t.integer :cell_row
      t.integer :cell_column
      t.boolean :cell_state

      t.timestamps null: false
    end
  end
end
