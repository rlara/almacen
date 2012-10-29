class AddIscloseToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :isclose, :boolean
  end
end
