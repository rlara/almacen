class StockM < ActiveRecord::Base
  attr_accessible :branch_id, :day, :product_id, :quantity

  validates :branch_id, :day, :product_id, :quantity, :presence => true


end
