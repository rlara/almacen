class CreateStockMs < ActiveRecord::Migration
  def change
    create_table :stock_ms do |t|
      t.integer :branch_id
      t.integer :product_id
      t.string :day

      t.timestamps
    end
  end
end
