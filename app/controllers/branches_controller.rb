class BranchesController < ApplicationController

before_filter :authenticate_any!


def authenticate_any!
  if admin_signed_in?
    true
  else
    authenticate_user!
  end
end

# GET /branches
  # GET /branches.json
  def index
    @branches = Branch.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @branches }
    end
  end

  # GET /branches/1
  # GET /branches/1.json
  def show
    @branch = Branch.find(params[:id])
    unless session[:change_status].nil?
      @ord = session[:change_status]
      session[:change_status] = nil
      if Order.where(:atach => @ord.atach).count == 2
        @ord.update_attributes(:status => 'complete')
      end
    end
    #Ver todas las salidas de la sucursal
    @orders = Order.where(:branch_id => (params[:id]), :mode => '1').order("created_at DESC").limit(10)
    #Ver todas las entradas de la sucursal
    @order_list_entry = Order.where(:branch_id=>(params[:id]), :mode => ['3','2']).order("created_at DESC").limit(10)
    #Ver lista de ordenes pendiente
    @orders_entry_pending = Order.where(:destination =>(params[:id]), :status => 'pending').order("created_at DESC").limit(10)
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @branch }
    end

  end

  # GET /branches/new
  # GET /branches/new.json
  def new
    @branch = Branch.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @branch }
    end
  end


  # GET /branches/1/edit
  def edit
    @branch = Branch.find(params[:id])
  end

  # POST /branches
  # POST /branches.json
  def create
    @branch = Branch.new(params[:branch])

    respond_to do |format|
      if @branch.save
        format.html { redirect_to branches_path, notice: 'Branch was successfully created.' }
        format.json { render json: @branch, status: :created, location: @branch }
      else
        format.html { render action: "new" }
        format.json { render json: @branch.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /branches/1
  # PUT /branches/1.json
  def update
    @branch = Branch.find(params[:id])

    respond_to do |format|
      if @branch.update_attributes(params[:branch])
        format.html { redirect_to @branch, notice: 'Branch was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @branch.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /branches/1
  # DELETE /branches/1.json
  def destroy
    @branch = Branch.find(params[:id])
    @branch.destroy

    respond_to do |format|
      format.html { redirect_to branches_url }
      format.json { head :no_content }
    end
  end
end
