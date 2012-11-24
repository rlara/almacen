class RemoveQuantiyFromStockM < ActiveRecord::Migration
  def up
    remove_column :stock_ms, :quantiy
      end

  def down
    add_column :stock_ms, :quantiy, :integer
  end
end
