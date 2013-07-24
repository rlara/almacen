class ChangeDataTypeForQuantity < ActiveRecord::Migration
  def up
    change_column :order_details, :quantity, :decimal
  end

  def down
  end
end
