class AddIndexToGameResult < ActiveRecord::Migration
  def change
  	add_index :game_results, :home_shop_id
  	add_index :game_results, :away_shop_id
  	add_index :game_results, :winning_type_id
  end
end
