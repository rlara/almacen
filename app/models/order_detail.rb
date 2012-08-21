class OrderDetail < ActiveRecord::Base
  belongs_to :order
  belongs_to :product
  attr_accessible :note, :quantity, :product_id
  validates :product_id, :presence=>true
end
