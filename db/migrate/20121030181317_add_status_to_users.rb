class AddStatusToUsers < ActiveRecord::Migration
  def change
    add_column :users, :status, :boolean, :default => false
    add_column :users, :username, :string
  end
  
  def self.down
    remove_column :users, :status
    remove_column :users, :username
  end
end
