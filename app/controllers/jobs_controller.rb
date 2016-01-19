class JobsController < ApplicationController
  def index
  	@jobs = Job.all
  end

  def show
  	@job = Job.find(params[:id])
  end

  def new
    @boat = Boat.find(params[:boat_id])
  	@job = Job.new
  end

  def create
  	@boat= Boat.find(params[:boat_id])
  	@job = @boat.jobs.build(job_params)
  	@job.user = current_user
  	@job.save
  	redirect_to boats_path
  end


private
	def job_params
		params.require(:job).permit(:name, :cost, :note, :origin, :destination)

	end
end