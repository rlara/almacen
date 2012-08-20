class Move < ActiveRecord::Base
  belongs_to :product
  belongs_to :order
  belongs_to :branch
  attr_accessible :amount_d, :amount_h, :amount_s, :date_move, :entry, :existence, :output
end
