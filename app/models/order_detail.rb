class OrderDetail < ActiveRecord::Base
  belongs_to :order
  belongs_to :product
  attr_accessible :note, :quantity_receive, :quantity_send
end
