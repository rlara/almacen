class OrdersController < ApplicationController
autocomplete :products_search, {:product => [:name, :sku]}

 before_filter :get_branch

  def get_branch
    @branch = Branch.find(params[:branch_id])
  end



  # GET /orders
  # GET /orders.json
  def index
    @orders = @branch.orders.limit(100).paginate(:page=>params[:page], :per_page=>20)
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @orders }
    end
  end

  def reports
    @orders_r = @branch.orders.where(:date=> Date.today).order("created_at desc")
    @order_close = @branch.orders.find_by_mode_and_date("4",Date.today)

    respond_to do |format|
      format.html
      format.json {render json: @order}
    end
  end




  def date_reports
    unless params[:orders_r].nil?
      dstart = params[:orders_r][:date]
      dend = params[:orders_r][:datend]
      @prod = params[:orders_r][:product_id]
      @orders = @branch.orders.find(:all, :conditions => ['date >= ? AND date <= ?',dstart,dend])
    end
    respond_to do |format|
      format.html
      format.json {render json: @orders_r}
    end
  end



  def new_mov
    @order = Order.find(params[:id])
    @dif_ord = Order.find(@order.atach)
    @total = 0
    @order.order_details.each do |prod|
      suma = prod.price * prod.quantity
      @total = @total + suma
    end
    respond_to do |format|
      format.html
      format.json {render json: @order}
    end
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
    @order = Order.find(params[:id])
    session[:change_status] = @order
    unless session[:order_new].nil?
      @order_new=session[:order_new]
      session[:order_new] = nil
    else
      @order_new = Order.new
      @order.order_details.each do |p|
        product_var = @order_new.order_details.build
        product_var.product_id = p.product_id
        product_var.quantity = p.quantity
      end
    end
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @order }
    end
  end

  # GET /orders/new
  # GET /orders/new.json
  def new
    @order = Order.new
    1.times {@order.order_details.build}
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @order }
    end
  end

  # GET /orders/1/edit
  def edit
    @order = Order.find(params[:id])
  end


  # Entrada de proveedor /orders/provision
  def provision
    @order = Order.new
    1.times {@order.order_details.build}
    respond_to do |format|
      format.html # provision.html.erb
      format.json { render json: @order }
    end
  end

  # Entrada de proveedor /orders/provision
  def stock
    @order = Order.new
    @moves = Move.where(:branch_id => params[:branch_id])
    @moves.each do |m|
      product_stock = @order.order_details.build
      product_stock.product_id = m.product_id
      product_stock.quantity = m.existence
    end
    respond_to do |format|
      format.html # provision.html.erb
      format.json { render json: @order }
    end
  end



  # POST /orders
  # POST /orders.json
  def create
    @order = @branch.orders.create(params[:order])
    respond_to do |format|
        if @order.save
          format.html { redirect_to branch_mov_prod_path(@branch,@order), notice: 'Order was successfully created.' }
          format.json { render json: @order, status: :created, location: @order }
        else
          if params[:order][:action] == "show"
          	format.html { redirect_to branch_order_path(@branch, @order.atach) }
          	format.json { render json: @order.errors, status: :unprocessable_entity }
            session[:order_new] = @order
          else
          	format.html { render "new" }
          	format.json { render json: @order.errors, status: :unprocessable_entity }
          end
        end
      end
  end

  # PUT /orders/1
  # PUT /orders/1.json
  def update
    @order = Order.find(params[:id])

    respond_to do |format|
      if @order.update_attributes(params[:order])
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order = Order.find(params[:id])
    @order.destroy

    respond_to do |format|
      format.html { redirect_to orders_url }
      format.json { head :no_content }
    end
  end

  def create_prov
    @order = @branch.orders.create(params[:order])
    respond_to do |format|
        if @order.save
          format.html { redirect_to branch_mov_prod_path(@branch,@order), notice: 'Order was successfully created.' }
          format.json { render json: @order }
        else
          format.html { render "provision" }
          format.json { render json: @order.errors, status: :unprocessable_entity }
        end
      end
  end


  def create_stock
    @order = @branch.orders.create(params[:order])
    respond_to do |format|
        if @order.save
          format.html { redirect_to branch_path(@branch), notice: 'Order was successfully created.' }
          format.json { render json: @order }
        else
          format.html { render "stock" }
          format.json { render json: @order.errors, status: :unprocessable_entity }
        end
      end
  end



end
