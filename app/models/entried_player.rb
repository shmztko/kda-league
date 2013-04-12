class EntriedPlayer < ActiveRecord::Base
  belongs_to :player
  belongs_to :game_detail
  # attr_accessible :title, :body
end
