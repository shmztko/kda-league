class GameDetail < ActiveRecord::Base
  attr_accessible :legs, :throws, :shop

  belongs_to :game
  belongs_to :shop

  has_many :players, :through => 'entried_palyers'
end
