class CreateWinningTypes < ActiveRecord::Migration
  def change
    create_table :winning_types do |t|
    	t.string :kind
    	t.string :label
		
		t.timestamps
    end
  end
end
