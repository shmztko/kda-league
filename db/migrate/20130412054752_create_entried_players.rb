class CreateEntriedPlayers < ActiveRecord::Migration
  def change
    create_table :entried_players, :id => false  do |t|
      t.references :player
      t.references :game_detail
    end
    add_index :entried_players, :player_id
    add_index :entried_players, :game_detail_id
  end
end
