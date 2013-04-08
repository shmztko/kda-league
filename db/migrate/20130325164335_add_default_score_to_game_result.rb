class AddDefaultScoreToGameResult < ActiveRecord::Migration
  def change
    change_column :game_results, :home_score, :integer, :default => 0
    execute 'UPDATE game_results SET home_score = 0 WHERE home_score IS NULL'
    #GameResult.where("home_score is null").update_all("home_score=0")
    change_column :game_results, :away_score, :integer, :default => 0
    
    execute 'UPDATE game_results SET away_score = 0 WHERE away_score IS NULL'
    #GameResult.where("away_score is null").update_all("away_score=0")
  end
end
