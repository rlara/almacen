class StockmController < ApplicationController
  def new
    @minimum = StockM.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @minimum }
    end

  end

  def edit
    @minimum = StockM.find(params[:id])
  end

  def show
  @minimum = StockM.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @minimum }
    end
  end

  def index
    @minimums = StockM.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @minimum }
    end
  end

  def create
    @minimum = StockM.new(params[:stock_m])

    respond_to do |format|
      if @minimum.save
        format.html { redirect_to stock_ms_path, notice: 'Move was successfully created.' }
        format.json { render json: @minimum, status: :created, location: @minimum }
      else
        format.html { render action: "new" }
        format.json { render json: @minimum.errors, status: :unprocessable_entity }
      end
    end

  end

  def update
    @minimum = StockM.find(params[:id])

    respond_to do |format|
      if @minimum.update_attributes(params[:minimum])
        format.html { redirect_to stock_ms_path, notice: 'Move was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @minimum.errors, status: :unprocessable_entity }
      end
    end

  end

  def destroy
    @minimum = StockM.find(params[:id])
    @minimum.destroy

    respond_to do |format|
      format.html { redirect_to stock_ms_path }
      format.json { head :no_content }
    end

  end

end
