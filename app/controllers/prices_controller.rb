class PricesController < ApplicationController
  # /prices
  # GET
  def index
    @prices = stock.prices.find :all 
  end

  # /prices/1
  # GET
  def show
    @price = stock.prices.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render :template => 'errors/404', :status => 404 
  end

  # /prices/new
  # GET
  def new
    stock
  end

  # /prices
  # POST
  def create
    @price = stock.prices.new(params[:price])
    @price.save!
    redirect_to stock_price_path(stock, @price)
  rescue ActiveRecord::RecordInvalid
    render :action => 'new'
  end

  # /prices/1/edit
  # GET
  def edit
    @price = stock.prices.find(params[:id])
  end

  # /prices/1
  # PUT
  def update
    @price = stock.prices.find(params[:id])
    @price.attributes = params[:price]
    @price.save!

    flash[:notice] = "Stock updated!"
    redirect_to stock_price_path(stock, @price)
  rescue ActiveRecord::RecordInvalid
    render :action => 'edit'
  end

  # /prices/1/delete
  # GET
  def delete

  end

  # /prices/1
  # DELETE
  def destroy
    @price = stock.prices.find(params[:id])
    @price.destroy
    flash[:notice] = "Stock deleted!"
    redirect_to prices_path
  end

protected
  def stock
    @stock ||= Stock.find(params[:stock_id])
  end
end
