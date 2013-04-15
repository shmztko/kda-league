class ShopsController < ApplicationController
  # GET /shops
  def index
    @shops = Shop.all
  end

  # GET /shops/1
  def show
    @shop = Shop.find(params[:id])
  end

  # GET /shops/new
  def new
    @shop = Shop.new
    @players = Player.all
  end

  # GET /shops/1/edit
  def edit
    @shop = Shop.find(params[:id])
  end

  # POST /shops
  def create
    @shop = Shop.new(params[:shop])

    if @shop.save
      redirect_to @shop, notice: 'Shop was successfully created.'
    else
      render action: "new"
    end
  end

  # PUT /shops/1
  def update
    @shop = Shop.find(params[:id])

    if @shop.update_attributes(params[:shop])
      redirect_to @shop, notice: 'Shop was successfully updated.'
    else
      render action: "edit"
    end
  end

  # DELETE /shops/1
  def destroy
    @shop = Shop.find(params[:id])
    @shop.destroy

    redirect_to shops_url
  end
end
