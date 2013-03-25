class AddDefaultScoreToGameResult < ActiveRecord::Migration
  def change
    change_column :game_results, :home_score, :integer, :default => 0
    GameResult.where("home_score is null").update_all("home_score=0")
    change_column :game_results, :away_score, :integer, :default => 0
    GameResult.where("away_score is null").update_all("away_score=0")
  end
end
