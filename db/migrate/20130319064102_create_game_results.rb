class CreateGameResults < ActiveRecord::Migration
  def change
    create_table :game_results do |t|
      t.date :scheduled_at
      t.references :home_shop
      t.references :away_shop
      t.references :winning_type
      t.integer :home_score
      t.integer :away_score

      t.timestamps
    end
  end
end
