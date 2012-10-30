class AddQuantityToStockMs < ActiveRecord::Migration
  def change
    add_column :stock_ms, :quantiy, :integer
  end
end
