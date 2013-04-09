class AddIsAbstainedColumn < ActiveRecord::Migration
  def change
  	add_column :games, :is_abstained, :boolean, :default => false
    
    execute  "UPDATE games SET is_abstained=0
      WHERE winning_type_id IN (
        SELECT id FROM winning_types WHERE kind LIKE '%default%'
      )"
  end
end
