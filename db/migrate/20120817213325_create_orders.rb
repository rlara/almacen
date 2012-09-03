class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.references :branch
      t.string :mode	
      t.integer :destination
      t.integer :user_id
      t.date :date  	
      t.string :dealer
      t.integer :atach
      t.string :status

      t.timestamps
    end
    add_index :orders, :branch_id
  end
end
