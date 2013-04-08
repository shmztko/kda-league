class SetIsAbstainedValue < ActiveRecord::Migration
  def change
    GameResult.all.each do |g|
      if g.winning_type.nil? == false && g.winning_type.kind.include?('default') then
      	g.is_abstained = true
      	g.save
      end
    end
  end
end
