class GameResult < ActiveRecord::Base
  attr_accessible :away_score, :home_score, :scheduled_at
  attr_accessible :home_shop, :away_shop, :winning_type
  belongs_to :home_shop, :foreign_key => :home_shop_id, :class_name => 'Shop'
  belongs_to :away_shop, :foreign_key => :away_shop_id, :class_name => 'Shop'
  belongs_to :winning_type

  validates :scheduled_at, :presence => true
  validates :home_shop, :presence => true
  validates :away_shop, :presence => true
  validates :home_score, :numericality => {:only_integer => true, :allow_nil => true, :less_than => 9}
  validates :away_score, :numericality => {:only_integer => true, :allow_nil => true, :less_than => 9}

end