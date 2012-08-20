class Branch < ActiveRecord::Base
  has_many :orders
  attr_accessible :location, :name
  accepts_nested_attributes_for :orders
  validates :name, :location, :presence => true

end
