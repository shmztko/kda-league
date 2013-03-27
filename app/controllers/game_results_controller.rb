class GameResultsController < ApplicationController
  # GET /game_results
  def index
    @game_results_by_date = GameResult.find(:all, :order => 'scheduled_at desc').inject(Hash.new) {|result, g|
      if result.key?(g.scheduled_at) then
        result[g.scheduled_at].push(g)
      else
        result[g.scheduled_at] = [g];
      end
      result
    }

  end

  # GET /game_results/new
  def new
    @game_result = GameResult.new
    prepare_for_rendering
  end

  # GET /game_results/1/edit
  def edit
    @game_result = GameResult.find(params[:id])
    prepare_for_rendering
  end

  # POST /game_results
  def create
    @game_result = GameResult.new(prepare_for_game_result(params)[:game_result])
    if @game_result.save
      redirect_to game_results_path, notice: t('message.created')
    else
      prepare_for_rendering
      render action: 'new'
    end
  end

  # PUT /game_results/1
  def update
    @game_result = GameResult.find(params[:id])

    if @game_result.update_attributes(prepare_for_game_result(params)[:game_result])
      redirect_to game_results_path, notice: t('message.updated')
    else
      prepare_for_rendering
      render action: 'edit'
    end
  end

  # DELETE /game_results/1
  def destroy
    @game_result = GameResult.find(params[:id])
    @game_result.destroy
    redirect_to @game_result
  end


private
  def prepare_for_game_result(params)
    params[:game_result][:home_shop] =  params[:game_result][:home_shop].empty? ? nil : Shop.find(params[:game_result][:home_shop])
    params[:game_result][:away_shop] =  params[:game_result][:away_shop].empty? ? nil : Shop.find(params[:game_result][:away_shop])
    params[:game_result][:winning_type] =  params[:game_result][:winning_type].empty? ? nil : WinningType.find(params[:game_result][:winning_type])
    return params
  end
  def prepare_for_rendering
    @winning_types = WinningType.all
    @shops = Shop.all
  end
end
