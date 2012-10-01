class AddPriceToOrderDetails < ActiveRecord::Migration
  def change
    add_column :order_details, :price, :integer
  end
end
