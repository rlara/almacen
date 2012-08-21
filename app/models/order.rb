class Order < ActiveRecord::Base
  belongs_to :branch
  has_many :order_details
  attr_accessible :dealer, :destination, :atach, :user_id, :order_details_attributes, :mode
  validates :mode, :destination, :presence => true

  accepts_nested_attributes_for :order_details

  before_create :create_atach

  def create_atach
    self.atach = self.id
  end

  MODE = ['Pedido-Proveedor','Pedido-Sucursal','Salida-Sucursal','Salida-mismo','Entrada-Sucursal','Entrada-proveedor']
  DEALER = ['Roberto','Sergio','Carlos']

  class << self
    DEALER.each do |dealer|
      define_method "cat_#{dealer}" do
        dealer
      end
     MODE.each do |name_mode|
      define_method "cat_#{name_mode}" do
        name_mode
      end
    end
    end
  end

end
