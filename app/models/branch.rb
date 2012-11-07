class Branch < ActiveRecord::Base
  has_many :orders, :dependent => :destroy
  attr_accessible :location, :name, :provider
  accepts_nested_attributes_for :orders
  validates :name, :location, :presence => true

end
