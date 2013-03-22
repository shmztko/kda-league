class GameResultsController < ApplicationController
  # GET /game_results
  def index
    @game_results = GameResult.find :all, :order => 'scheduled_at desc'
    @notice = params[:notice]
  end

  # GET /game_results/1
  def show
    @game_result = GameResult.find(params[:id])
  end

  # GET /game_results/new
  def new
    @game_result = GameResult.new
    @shops = Shop.all
    @winning_types = WinningType.all
  end

  # GET /game_results/1/edit
  def edit
    @game_result = GameResult.find(params[:id])
    @shops = Shop.all
    @winning_types = WinningType.all
  end

  # POST /game_results
  def create
    @game_result = GameResult.new(prepare(params)[:game_result])
    if @game_result.save
      redirect_to :action => 'index', notice: 'Game result was successfully created.'
    else
      render action: "new"
    end
  end

  # PUT /game_results/1
  def update
    @game_result = GameResult.find(params[:id])

    if @game_result.update_attributes(prepare(params)[:game_result])
      redirect_to :action => 'index', notice: 'Game result was successfully updated.'
    else
      render action: "edit"
    end
  end

  # DELETE /game_results/1
  def destroy
    @game_result = GameResult.find(params[:id])
    @game_result.destroy
    redirect_to @game_result
  end


private
  def prepare(params)
    params[:game_result][:home_shop] = Shop.find(params[:game_result][:home_shop])
    params[:game_result][:away_shop] = Shop.find(params[:game_result][:away_shop])
    if params[:game_result][:winning_type] != ''
      params[:game_result][:winning_type] = WinningType.find(params[:game_result][:winning_type])
    else
      params[:game_result][:winning_type] = nil
    end
    params
  end
end
