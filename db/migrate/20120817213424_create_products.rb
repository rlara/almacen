class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.references :provider
      t.string :name
      t.text :sku
      t.date :date
      t.decimal :price
      t.string :units	

      t.timestamps
    end
    add_index :products, :provider_id
  end
end
