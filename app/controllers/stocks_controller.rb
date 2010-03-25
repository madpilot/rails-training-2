class StocksController < ApplicationController
  # /stocks
  # GET
  def index
    @stocks = Stock.find :all 
  end

  # /stocks/1
  # GET
  def show
    @stock = Stock.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render :template => 'errors/404', :status => 404 
  end

  # /stocks/new
  # GET
  def new
  end

  # /stocks
  # POST
  def create
    @stock = Stock.new(params[:stock])
    @stock.save!
    redirect_to stock_path(@stock)
  rescue ActiveRecord::RecordInvalid
    render :action => 'new', :status => 422
  end

  # /stocks/1/edit
  # GET
  def edit
    @stock = Stock.find(params[:id])
    raise ActiveRecord::RecordNotFound if @stock.code == 'ABC'
  end

  # /stocks/1
  # PUT
  def update
    @stock = Stock.find(params[:id])
    @stock.attributes = params[:stock]
    @stock.save!

    flash[:notice] = "Stock updated!"
    redirect_to stock_path(@stock)
  rescue ActiveRecord::RecordInvalid
    render :action => 'edit'
  end

  # /stocks/1/delete
  # GET
  def delete

  end

  # /stocks/1
  # DELETE
  def destroy
    @stock = Stock.find(params[:id])
    @stock.destroy
    flash[:notice] = "Stock deleted!"
    redirect_to stocks_path
  end
end
