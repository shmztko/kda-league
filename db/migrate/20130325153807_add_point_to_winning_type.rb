class AddPointToWinningType < ActiveRecord::Migration
  def change
  	add_column :winning_types, :point, :integer
  end
end
