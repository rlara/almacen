class Order < ActiveRecord::Base
  belongs_to :branch
  has_many :order_details
  has_many :moves
  attr_accessible :dealer, :destination, :atach, :user_id, :order_details_attributes, :mode
  validates :mode, :destination, :presence => true

  accepts_nested_attributes_for :order_details
  accepts_nested_attributes_for :moves


  before_save :create_atach

  def create_atach
    if self.atach == nil
      self.atach = self.id
    end
  end

  DEALER = ['Roberto','Sergio','Carlos']

  class << self
    DEALER.each do |dealer|
      define_method "cat_#{dealer}" do
        dealer
      end
    end
  end

end
