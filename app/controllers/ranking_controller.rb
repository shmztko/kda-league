class RankingController < ApplicationController
  def show
    @result_for_shop = Shop.all.map {| shop |
      {
        :shop => shop,
        :point => (get_point(shop, :home) + get_point(shop, :away)),
        :wins => (get_wins(shop, :home) + get_wins(shop, :away)),
        :loses => (get_loses(shop, :home) + get_loses(shop, :away))
      }
    }.sort{|a, b| if a[:point] == b[:point] then 0 elsif a[:point] < b[:point] then 1 else -1 end}
  end

private
  def get_point shop, home_away
      GameResult.find(:all, :conditions => ["#{home_away}_shop_id = ?", shop.id]).map {|g| 
        if home_away == :home
          g.home_score + (g.away_score < g.home_score ? (g.winning_type.try(:point) || 0 ) : 0)
        else 
          g.away_score + (g.away_score > g.home_score ? (g.winning_type.try(:point) || 0 ) : 0)  
        end
      }.inject(0) {|result, item| result += item}
  end

  def get_wins shop, home_away
    GameResult.find(:all, :conditions => ["#{home_away}_shop_id = ?", shop.id]).map {|g|
      if g.home_score == 0 && g.away_score == 0
        0
      elsif home_away == :home
        g.home_score > g.away_score ? 1 : 0
      else
        g.home_score < g.away_score ? 1 : 0
      end
    }.inject(0) {|result, value| result += value}
  end

  def get_loses shop, home_away
    GameResult.find(:all, :conditions => ["#{home_away}_shop_id = ?", shop.id]).map {|g|
      if g.home_score == 0 && g.away_score == 0
        0
      elsif home_away == :home
        g.home_score > g.away_score ? 0 : 1
      else
        g.home_score < g.away_score ? 0 : 1
      end
    }.inject(0) {|result, value| result += value}
  end
end
