class AddActionToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :action, :string
  end
end
