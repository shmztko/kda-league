class Player < ActiveRecord::Base
  attr_accessible :name, :shop

  belongs_to :shop

  has_many :game_details, :through => 'entried_palyers'
end
