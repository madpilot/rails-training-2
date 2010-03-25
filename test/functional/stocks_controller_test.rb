require 'test_helper'

class StocksControllerTest < ActionController::TestCase
  context '' do
    setup do
      @stock_1 = Stock.make
      @stock_2 = Stock.make
      @stock_3 = Stock.make
      @stock_4 = Stock.make
      @stock_5 = Stock.make
    end

    context 'index' do
      setup do
        @stock_6 = Stock.make
        @stock_7 = Stock.make
        @stock_8 = Stock.make
        @stock_9 = Stock.make
        @stock_10 = Stock.make
      end

      should 'return all the stocks in the database' do
        get 'index'
        assert_equal Stock.find(:all), assigns['stocks']
        assert_equal 10, assigns['stocks'].size
      end
    end

    context 'show' do
      should 'return the stock with the given id' do
        get 'show', 'id' => @stock_1.id
        assert_response :success
        assert_equal @stock_1, assigns['stock']
      end

      should "render a 404 if the stock item doesn't exist" do
        get 'show', 'id' => 0
        assert_response :not_found
      end
    end

    context 'new' do
      should 'return success' do
        get 'new'
        assert_response :success
        assert_template 'stocks/new'
        assert_tag :tag => 'form'
      end
    end

    context 'create' do
      should 'create a new stock object' do
        assert_difference 'Stock.count', 1 do
          post 'create', 'stock' => { 'code' => 'XYZ' }
        end
        assert_equal 'XYZ', assigns['stock'].code
        assert_response :redirect
        assert_redirected_to stock_path(assigns['stock'])
      end

      should 're-render new form with errors set with attributes are invalid' do
        assert_no_difference 'Stock.count' do
          post 'create', 'stock' => { 'code' => '' }
        end
        assert_response 422
        assert_template 'stocks/new'
        assert !assigns['stock'].errors.empty?
      end
    end

    context 'edit' do
      should 'return a 404 if stock code is ABC' do
        Stock.any_instance.stubs(:code).returns('ABC')
        assert_raise ActiveRecord::RecordNotFound do
          get 'edit', 'id' => @stock_1.id
        end
      end
    end
  end
end
