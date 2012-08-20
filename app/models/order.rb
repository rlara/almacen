class Order < ActiveRecord::Base
  belongs_to :branch
  has_many :order_details
  attr_accessible :dealer, :destination, :status, :user_id, :order_details_attributes, :mode
  validates :mode, :destination, :presence => true

  before_create :create_status
  accepts_nested_attributes_for :order_details

  def create_status
    self.status = "nuevo"
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
