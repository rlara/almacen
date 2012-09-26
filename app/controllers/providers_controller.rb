class ProvidersController < ApplicationController
before_filter :get_branch

  def get_branch
    @branch = Branch.find(params[:branch_id])
  end


  # GET /providers
  # GET /providers.json
  def index
    @orders = Order.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @orders }
    end
  end

  # GET /providers/1
  # GET /providers/1.json
  def show
    @order = Order.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @order }
    end
  end

  # GET /providers/new
  # GET /providers/new.json
  def new
    @order = Order.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @order }
    end
  end

  # GET /providers/1/edit
  def edit
    @order = Order.find(params[:id])
  end

  # POST /providers
  # POST /providers.json
  def create
    @order = Order.new(params[:order])

    respond_to do |format|
      if @order.save
        format.html { redirect_to @order, notice: 'Provider was successfully created.' }
        format.json { render json: @order, status: :created, location: @order }
      else
        format.html { render action: "new" }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /providers/1
  # PUT /providers/1.json
  def update
    @provider = Order.find(params[:id])

    respond_to do |format|
      if @provider.update_attributes(params[:provider])
        format.html { redirect_to @provider, notice: 'Provider was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @provider.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /providers/1
  # DELETE /providers/1.json
  def destroy
    @provider = Order.find(params[:id])
    @provider.destroy

    respond_to do |format|
      format.html { redirect_to providers_url }
      format.json { head :no_content }
    end
  end
end
