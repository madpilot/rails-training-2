class Price < ActiveRecord::Base
  validates_numericality_of :open_price
  validates_numericality_of :close_price
  validates_numericality_of :low_price
  validates_numericality_of :high_price
  validates_numericality_of :value

  belongs_to :stock
end
