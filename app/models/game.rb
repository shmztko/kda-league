class Game < ActiveRecord::Base
  TOTAL_LEGS = 9

  attr_accessible :away_score, :home_score, :scheduled_at
  attr_accessible :home_shop, :away_shop, :winning_type
  attr_accessible :is_abstained

  has_many :game_details

  belongs_to :home_shop, :foreign_key => :home_shop_id, :class_name => 'Shop'
  belongs_to :away_shop, :foreign_key => :away_shop_id, :class_name => 'Shop'
  belongs_to :winning_type

  validates :scheduled_at, :presence => true
  validates :home_shop, :presence => true
  validates :away_shop, :presence => true
  validates :home_score, :numericality => {:only_integer => true, :allow_nil => true, :less_than_or_equal_to => TOTAL_LEGS}
  validates :away_score, :numericality => {:only_integer => true, :allow_nil => true, :less_than_or_equal_to => TOTAL_LEGS}

  validate :score_combination

  def score_combination
    errors.add :base, I18n.t('activerecord.errors.score_combination', :total => TOTAL_LEGS) if (away_score + home_score) > TOTAL_LEGS
  end

end
