class ChangeDataTypeForPrice < ActiveRecord::Migration
  def up
    change_column :order_details, :price, :decimal
  end

  def down
  end
end
