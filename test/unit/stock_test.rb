require 'test_helper'

class StockTest < ActiveSupport::TestCase
  context '' do
    setup do
      @stock = Stock.make(:code => 'ABC')
    end
    subject { @stock }

    should_have_many :prices

    context 'validate' do
      should 'check the presence of code' do
        @stock.code = nil
        assert !@stock.valid?
        assert_equal "can not be blank!", @stock.errors.on(:code)
      end
    end

    context 'print_nicely' do
      should 'print the code prefixed with the word Code:' do
        assert_equal "Code: ABC", @stock.print_nicely
      end
    end
  end
end
