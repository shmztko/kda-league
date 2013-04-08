class GameResult < ActiveRecord::Base
  TOTAL_LEGS = 9

  belongs_to :winning_type
  belongs_to :game
  attr_accessible :away_score, :home_score, :is_abstained

  validates :home_score, :numericality => {:only_integer => true, :allow_nil => true, :less_than_or_equal_to => TOTAL_LEGS}
  validates :away_score, :numericality => {:only_integer => true, :allow_nil => true, :less_than_or_equal_to => TOTAL_LEGS}

  validate :score_combination

  def score_combination
    errors.add :base, I18n.t('activerecord.errors.score_combination', :total => TOTAL_LEGS) if (away_score + home_score) > TOTAL_LEGS
  end
end
