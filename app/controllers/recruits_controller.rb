class RecruitsController < ApplicationController
  def new
    @recruit = Recruit.new
  end

  def create
    @recruit = Recruit.new(recruit_params)
    @recruit.user_id = current_user.id
    @recruit.save
    redirect_to recruit_path(@recruit.id)
  end

  def index
    
  end

  def show
    @recruit = Recruit.find(params[:id])
  end

  def destroy
  end

  private

  def recruit_params
    params.require(:recruit).permit(:title, :date, :time, :place, :headcount)
  end
end
