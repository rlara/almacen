class CreateMoves < ActiveRecord::Migration
  def change
    create_table :moves do |t|
      t.references :product
      t.references :order
      t.references :branch
      t.integer :entry
      t.integer :output
      t.integer :existence
      t.decimal :amount_d
      t.decimal :amount_h
      t.decimal :amount_s
      t.datetime :date_move

      t.timestamps
    end
    add_index :moves, :product_id
    add_index :moves, :order_id
    add_index :moves, :branch_id
  end
end
