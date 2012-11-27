class Order < ActiveRecord::Base
  belongs_to :branch
  has_many :order_details, :dependent => :destroy
  has_many :moves
  attr_accessible :dealer, :destination, :atach, :user_id, :order_details_attributes, :mode, :product_id, :date, :status, :action, :branch_id, :isclose
  validates :mode, :destination, :presence => true

  accepts_nested_attributes_for :order_details
  accepts_nested_attributes_for :moves

  MODES = ["1", "2", "3", "4", "5", "6"]

after_create :update_stock
before_save :create_atach

  def create_atach
#validar el campo atach
    if self.atach == nil
      self.atach = self.id
    end

    if self.isclose == nil
      self.isclose = false
    end
#Cambiar el precio de el producto si se modifico en la orden de entrada de proveedor
    if self.mode == "2"
      self.order_details.each do |od|
        precio = Product.find_by_id(od.product_id)
        if od.price == nil
          od.price = precio.price
        else
          precio.update_attributes(:price => od.price)
        end
      end
    else
      self.order_details.each do |od|
        precio = Product.find_by_id(od.product_id)
        od.price = precio.price
      end
    end
  end


  def update_stock
    generas = []
    generae = []
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
            if stock.existence > o.quantity
              rest = stock.existence - o.quantity
              generas << {:product_id => o.product_id, :quantity => rest}
            elsif stock.existence < o.quantity
              rest = o.quantity - stock.existence
              generae << {:product_id => o.product_id, :quantity => rest}
            end
            stock.update_attributes(:existence => o.quantity)
        end
      end
    end
    if self.mode == "4"
      unless generas.empty?
        a = Order.new
        a.branch_id = self.branch_id
        a.mode = "5"
        a.destination = 3
        a.isclose = true
        a.date = Date.today
        a.order_details.build(generas)
        a.save
      end
      ########
      unless generae.empty?
        ord_sum = Order.new
        ord_sum.mode = "6"
        ord_sum.branch_id = self.branch_id
        ord_sum.destination = 3
        ord_sum.isclose = true
        ord_sum.date = Date.today
        ord_sum.order_details.build(generae)
        ord_sum.save
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

