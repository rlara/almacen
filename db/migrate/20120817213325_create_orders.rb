class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.references :branch
      t.string :mode	
      t.string :destination
      t.string :user_id
      t.string :dealer
      t.integer :atach

      t.timestamps
    end
    add_index :orders, :branch_id
  end
end
