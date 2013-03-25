class RankingController < ApplicationController
  def show
    @point_for_shop = Shop.all.map {| shop |
      {:shop => shop, :point => (get_point(shop, :home) + get_point(shop, :away))}
    }.sort{|a, b| if a[:point] == b[:point] then 0 elsif a[:point] < b[:point] then 1 else -1 end}
  end

private
  def get_point shop, home_away
      GameResult.find(:all, :conditions => ["#{home_away}_shop_id = ?", shop.id]).map { |g| 
        if home_away == :home then
          g.home_score + (g.away_score < g.home_score ? (g.winning_type.try(:point) || 0 ) : 0)
        else 
          g.away_score + (g.away_score > g.home_score ? (g.winning_type.try(:point) || 0 ) : 0)  
        end
      }.inject{|result, item| result += item}
  end
end
