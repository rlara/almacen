class Move < ActiveRecord::Base
  belongs_to :order
  belongs_to :branch
  belongs_to :product
  attr_accessible :amount_d, :amount_h, :amount_s, :date_move, :entry, :existence, :output

end
