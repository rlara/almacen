class CreateOrderDetails < ActiveRecord::Migration
  def change
    create_table :order_details do |t|
      t.references :order
      t.references :product
      t.string :quantity_send
      t.string :quantity_receive
      t.text :note

      t.timestamps
    end
    add_index :order_details, :order_id
    add_index :order_details, :product_id
  end
end
