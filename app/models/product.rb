class Product < ActiveRecord::Base
  has_many :order_details
  has_many :moves
  attr_accessible :date, :name, :price, :sku, :units, :description, :category
  validates :name, :sku, :price, :presence => true

  scope :by_name_and_sku, lambda { |q| where("name LIKE ? OR sku LIKE ?", "%#{q}%", "%#{q}%") }

  CATEGORY = ['Refrescos', 'Comida', 'Agua', 'Carnes', 'Jarabes', 'Lacteos y Carnes Frias', 'Guisos']

  class << self
    CATEGORY.each do |category|
      define_method "cat_#{category}" do
        category
      end
    end
  end

end
