# encoding: utf-8
class DevideGameTable < ActiveRecord::Migration
  def change
    create_table :games_temp do |t|
      t.date :scheduled_at
      t.references :home_shop
      t.references :away_shop
      t.references :winning_type
      t.integer :home_score
      t.integer :away_score
      t.timestamps
    end

    execute 'INSERT INTO games_temp SELECT * FROM games'

    create_table :game_results do |t|
      t.references :game
      t.integer :home_score
      t.integer :away_score
      t.references :winning_type
      t.boolean :is_abstained, :default => false
      t.timestamps
    end

    execute 'INSERT INTO game_results(game_id, home_score, away_score, winning_type_id, created_at, updated_at) SELECT g.id, g.home_score, g.away_score, g.winning_type_id, g.created_at, g.updated_at FROM games g'
    
  end

end
