class ChangeGameResultTable < ActiveRecord::Migration
  def change
    rename_table :game_results, :games
  end
end
