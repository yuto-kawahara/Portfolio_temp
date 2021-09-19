class ReservationsController < ApplicationController
  def create
    @recruit = Recruit.find(params[:recruit_id])
    reservation = current_user.reservations.new(recruit_id: @recruit.id)
    reservation.save
    redirect_to recruit_path(@recruit.id)
  end

  def destroy
    @recruit = Recruit.find(params[:recruit_id])
    reservation = current_user.reservations.find_by(recruit_id: @recruit.id)
    reservation.destroy
    redirect_to recruit_path(@recruit.id)
  end
  
end
