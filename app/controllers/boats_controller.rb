class BoatsController < ApplicationController
  def index
  	@boats = Boat.all
  end

  def show
  	@boat = Boat.find(params[:id])
    @jobs = Job.where(boat_id: params[:id])
  end
  
  def edit
  	@boat = Boat.find(params[:id])
  end
  
  def new
  	@boat = Boat.new
  end

  def create
	  	@boat = current_user.boats.build(boat_params)
	  	if @boat.save
	  		redirect_to user_path(current_user)
	  	else
	  		flash[:alert] = "Whoops. Make sure all fields are filled."
	  	end
  end

  def update
  	
  end
  def destroy
  	@user = User.find(params[:id])
  	@boat= Boat.find(params[:id])
  		if @user == current_user
  			@boat.destroy
  			flash[:alert] = "Shipment cancelled"
  		else
  			flash[:alert] = "You can't edit or cancel this shipment."
	  end
	  	redirect_to user_path(@user)
	  end

  private
  	def boat_params
  		params.require(:boat).permit(:name, :location, :container)
  	end
end

# boat params are: name, location, #container