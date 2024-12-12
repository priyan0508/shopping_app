class AddressesController < ApplicationController
 before_action :set_address, only: [:show, :edit, :update, :destroy]

def new
	@address = Address.new
end

def index
	@addresses = current_user.addresses

  #@address = Address.find_by(user_id: params[:user_id]) # or however you're querying


end

def create
	@address = current_user.address.new(address_params)
	
	if @address.save
		redirect_to addresses_path, notice: 'Address added successfully.'
	else
		render.new
	end
end

def edit 
	#@address = current_user.address
end

def update
	# if current_user.address.update(address_params)
	# 	redirect_to root_path, notice: 'Address update successfully.'
	# else
	# 	render.edit
	# end
end

def destroy
	@address.destroy
	redirect_to user_addresses_path(@user), notice: "addresses deleted successfully!"

end

 private

 def set_address
    @address = Address.find_by(id: params[:address_id])
    if @address.nil?
      redirect_to address_path, alert: 'Address not found.'
    end
  end

  def address_params
    params.require(:address).permit(:colony, :city, :pincode, :country)
  end
end
