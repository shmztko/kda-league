class CreateGameDetails < ActiveRecord::Migration
  def change
    create_table :game_details do |t|
      t.integer :legs
      t.integer :throws
      t.references :game
      t.references :shop

      t.timestamps
    end
    add_index :game_details, :game_id, :shop_id
  end
end
