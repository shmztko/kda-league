# coding: utf-8
require 'spec_helper'

describe Game do
  fixtures :all

  before do
    @game = games(:game1)
  end

  it 'の詳細は複数取得できること' do
    @game.should have_at_least(2).game_details      
  end
end
