class Order < ActiveRecord::Base
  belongs_to :branch
  has_many :order_details
  has_many :moves
        attr_accessible :dealer, :destination, :atach, :user_id, :order_details_attributes, :mode, :product_id, :date, :status, :action
  validates :mode, :destination, :presence => true



  accepts_nested_attributes_for :order_details
  accepts_nested_attributes_for :moves


after_create :update_stock
before_save :create_atach
  def create_atach
    if self.atach == nil
      self.atach = self.id
    end

    if self.mode == "2"
      self.order_details.each do |od|
        precio = Product.find_by_id(od.product_id)
        precio.update_attributes(:price => od.price)
      end
    else
      self.order_details.each do |od|
        precio = Product.find_by_id(od.product_id)
        od.price = precio.price
      end
    end
  end


  def update_stock
    self.order_details.each do |o|
      stock = Move.find_by_product_id_and_branch_id(o.product_id, self.branch_id)
      if stock.nil?
        stock = Move.new
        stock.product_id = o.product_id
        stock.branch_id = self.branch_id
        if self.mode == "1"
          stock.existence = 0-o.quantity
        else
          stock.existence = o.quantity
        end
        stock.save
      else
        case self.mode
          when "1"
            stock.update_attributes(:existence => stock.existence - o.quantity)
          when "2"
            stock.update_attributes(:existence => stock.existence + o.quantity)
          when "3"
            stock.update_attributes(:existence => stock.existence + o.quantity)
          when "4"
            stock.update_attributes(:existence => o.quantity)
        end
      end
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

