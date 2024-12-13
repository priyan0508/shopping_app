class DeliveryDetailsController < ApplicationController
  before_action :set_product, only: [:new, :create, :index]
  before_action :set_delivery_detail, only: [:show, :edit, :update, :destroy]

  
 def index
  @product = Product.find(params[:product_id])
  @delivery_details = @product.delivery_details
 end

  def show
  end

  def new
    @delivery_detail = @product.delivery_details.new
  end

  
  def create
    @delivery_detail = @product.delivery_details.new(delivery_detail_params)
    if @delivery_detail.save
      redirect_to product_delivery_details_path(@product), notice: "Delivery detail created successfully."
    else
      render :new
    end
  end

 def edit
  @product = Product.find(params[:product_id])
  @delivery_detail = @product.delivery_details.find(params[:id])
 end


  def update
  if @delivery_detail.update(delivery_detail_params)

    redirect_to product_delivery_detail_path(@product, @delivery_detail), notice: "Delivery detail updated successfully."
  else
    render :edit
  end
end


  def destroy
    @delivery_detail.destroy
    redirect_to product_delivery_details_path(@delivery_detail.product), notice: "Delivery detail deleted successfully."
  end

  private

 def set_product
  @product = Product.find_by(id: params[:product_id])
  redirect_to products_path, alert: "Product not found" if @product.nil?
end



def set_delivery_detail
  @product = Product.find_by(id: params[:product_id])
  
  if @product
    @delivery_detail = @product.delivery_details.find_by(id: params[:id])
    
    unless @delivery_detail
      redirect_to products_path, alert: "Delivery Detail not found" and return
    end
  else
    redirect_to products_path, alert: "Product not found" and return
  end
end




  # Permit delivery detail parameters
  def delivery_detail_params
    params.require(:delivery_detail).permit(:date, :product_id)
  end
end