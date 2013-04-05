class PlayersController < ApplicationController
  # GET /players
  def index
    @players = Player.all
  end

  # GET /players/1
  def show
    @player = Player.find(params[:id])
  end

  # GET /players/new
  def new
    @player = Player.new
    @shops = Shop.all
  end

  # GET /players/1/edit
  def edit
    @player = Player.find(params[:id])
    @shops = Shop.all
  end

  # POST /players
  def create
    @player = Player.new(prepare_for_save(params)[:player])

    if @player.save
      redirect_to @player, notice: 'Player was successfully created.'
    else
      render action: "new"
    end
  end

  # PUT /players/1
  def update
    @player = Player.find(params[:id])
    if @player.update_attributes(prepare_for_save(params)[:player])
      redirect_to @player, notice: 'Player was successfully updated.'
    else
      render action: "edit"
    end
  end

  # DELETE /players/1
  # DELETE /players/1.json
  def destroy
    @player = Player.find(params[:id])
    @player.destroy
    redirect_to players_url
  end

private
  def prepare_for_save(params)
    params[:player][:shop] =  params[:player][:shop].empty? ? nil : Shop.find(params[:player][:shop])
    return params
  end
end
