class BoatsController < ApplicationController
  def index
  	@boats = Boat.all
  end

  def show
  	@boat = Boat.find(params[:id])
    @jobs = Job.where(boat_id: params[:id])
  end

  def new
  	@boat = Boat.new
    @user = current_user
  end

  def create
    @boat = current_user.boats.build(boat_params)
    if @boat.save
      puts "?????????????????????????????????"
      redirect_to user_path(current_user)
    else
      p "?????????????????????????????????else render"
      flash[:alert] = "Whoops. Make sure all fields are filled."
      render new_boat_path
    end
  end
# 	  @boat = current_user.boats.build(boat_params)
# 	 	if @boat.save
#     redirect_to user_path(current_user)
#   else
#     redirect_to new_boat_path
#   end
# end

def edit
  @boat = Boat.find(params[:id])
end

def update
  @boat = Boat.find(params[:id])
  if @boat.update_attributes(boat_params)
    redirect_to boat_path(@boat)
  else
    render edit_boat_path(@boat) 
  end	
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
  params.require(:boat).permit(:name, :location, :container, :avatar, :user_id)
end
end
