class GameDetail < ActiveRecord::Base
  attr_accessible :legs, :throws

  belongs_to :game, :shop

  has_many :players, :through => 'entried_palyers'
end
