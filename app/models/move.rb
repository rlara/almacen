class Move < ActiveRecord::Base
  belongs_to :order
  belongs_to :branch
  belongs_to :product
  attr_accessible :date_move, :existence, :branch_id, :product_id, :order_id




end
