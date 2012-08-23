class Product < ActiveRecord::Base
  has_many :order_details
  has_many :moves
  attr_accessible :date, :name, :price, :sku, :units
  validates :name, :sku, :price, :presence => true

end
