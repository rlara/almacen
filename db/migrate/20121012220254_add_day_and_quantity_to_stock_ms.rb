class AddDayAndQuantityToStockMs < ActiveRecord::Migration
  def change
    add_column :stock_ms, :day, :integer
    add_column :stock_ms, :quantity, :integer
  end
end
