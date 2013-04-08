class GamesController < ApplicationController
  # GET /games
  def index
    @games_by_date = Game.find(:all, :order => 'scheduled_at desc').inject(Hash.new) {|result, g|
      if result.key?(g.scheduled_at) then
        result[g.scheduled_at].push(g)
      else
        result[g.scheduled_at] = [g];
      end
      result
    }
  end

  # GET /games/new
  def new
    @game = Game.new
    prepare_for_rendering
  end

  # GET /games/1/edit
  def edit
    @game = Game.find(params[:id])
    prepare_for_rendering
  end

  # POST /games
  def create
    @game = Game.new(prepare_for_save(params)[:game])
    if @game.save
      redirect_to games_path, notice: t('message.created')
    else
      prepare_for_rendering
      render action: 'new'
    end
  end

  # PUT /games/1
  def update
    @game = Game.find(params[:id])

    if @game.update_attributes(prepare_for_save(params)[:game])
      redirect_to games_path, notice: t('message.updated')
    else
      prepare_for_rendering
      render action: 'edit'
    end
  end

  # DELETE /games/1
  def destroy
    @game = Game.find(params[:id])
    @game.destroy
    redirect_to @game
  end


private
  def prepare_for_save(params)
    params[:game][:home_shop] =  params[:game][:home_shop].empty? ? nil : Shop.find(params[:game][:home_shop])
    params[:game][:away_shop] =  params[:game][:away_shop].empty? ? nil : Shop.find(params[:game][:away_shop])
    params[:game][:winning_type] =  params[:game][:winning_type].empty? ? nil : WinningType.find(params[:game][:winning_type])
    return params
  end
  def prepare_for_rendering
    @winning_types = WinningType.all
    @shops = Shop.all
  end
end
