class Stock < ActiveRecord::Base
  validates_presence_of :code, :message => 'can not be blank!'

  has_many :prices
end
