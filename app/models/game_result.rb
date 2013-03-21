class GameResult < ActiveRecord::Base
  attr_accessible :away_score, :home_score, :scheduled_at
  attr_accessible :home_shop, :away_shop, :winning_type
  belongs_to :home_shop, :foreign_key => :home_shop_id, :class_name => 'Shop'
  belongs_to :away_shop, :foreign_key => :away_shop_id, :class_name => 'Shop'
  belongs_to :winning_type
end
