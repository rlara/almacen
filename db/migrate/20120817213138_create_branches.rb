class CreateBranches < ActiveRecord::Migration
  def change
    create_table :branches do |t|
      t.string :name
      t.text :location
      t.boolean :provider     
 
      t.timestamps
    end
  end
end
