# coding: utf-8
require 'spec_helper'

describe Game do
  fixtures :all

  before do
    @game = games(:game1)
    @shop = shops(:shop1)
  end

  it 'の詳細は複数取得できること' do
    @game.should have_at_least(2).game_details      
  end

  it 'には詳細が追加できること' do
    @game.game_details.create(:shop => @shop, :legs => 2, :throws => 45)
    @game.game_details.create(:shop => @shop, :legs => 2, :throws => 0)

    @game.should have(4).game_details
  end
end
