class Product < ActiveRecord::Base
  has_many :order_details
  has_many :moves
  attr_accessible :date, :name, :price, :sku, :units, :description
  validates :name, :sku, :price, :presence => true

  scope :by_name_and_sku, lambda { |q| where("name LIKE ? OR sku LIKE ?", "%#{q}%", "%#{q}%") }

  def funky_method
    "#{self.name}.camelize"

  end




end
