class CreatePrices < ActiveRecord::Migration
  def self.up
    create_table :prices do |t|
      t.date :date
      t.float :open_price
      t.float :close_price
      t.float :low_price
      t.float :high_price
      t.integer :value
      t.integer :stock_id
      t.timestamps
    end
  end

  def self.down
    drop_table :prices
  end
end
