class RemoveDayFromStockMs < ActiveRecord::Migration
  def up
    remove_column :stock_ms, :day
      end

  def down
    add_column :stock_ms, :day, :string
  end
end
