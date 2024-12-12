class ProductsController < ApplicationController
  before_action :authenticate_user!

	def index
	    @products = Product.all
	end

	def new 
		@product = Product.new
	end

	def create
		 @product = Product.new(product_params)

		 if @product.save
		 	redirect_to products_path, notice: 'Product created successfully.'
		 else 
		 	render :new
		 end
	end

	def show
  @product = Product.find_by(id: params[:id])
  unless @product
    redirect_to products_path, alert: "Product not found"
  end
end


	def edit
  @product = Product.find(params[:id])
end


	def update
		@product = Product.find(params[:id])
		if @product.update(product_params)
			redirect_to products_path, notice: 'Product update successfully.'
		else
			render :edit
		end

	def destroy
		@product = Product.find(params[:id])
		@product.destroy
		redirect_to products_path, notice: 'Product deleted successfully.'
	end

	end

	private 

	def product_params
        params.require(:product).permit(:name, :price)
    end

end
