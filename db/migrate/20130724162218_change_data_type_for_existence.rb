class ChangeDataTypeForExistence < ActiveRecord::Migration
  def up
    change_column :moves, :existence, :decimal
  end

  def down
  end
end
