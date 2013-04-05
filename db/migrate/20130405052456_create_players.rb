class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :name
      t.references :shop

      t.timestamps
    end
    add_index :players, :shop_id
  end
end
