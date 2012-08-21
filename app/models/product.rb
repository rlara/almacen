class Product < ActiveRecord::Base
  has_many :order_details
  attr_accessible :date, :name, :price, :sku, :units
  validates :name, :sku, :price, :presence => true

end
