class Player < ActiveRecord::Base
  belongs_to :shop
  attr_accessible :name, :shop
end
