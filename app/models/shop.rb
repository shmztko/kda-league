class Shop < ActiveRecord::Base
  attr_accessible :name

  has_many :players
end
