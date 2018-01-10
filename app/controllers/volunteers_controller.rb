class VolunteersController < ApplicationController
  before_action :set_volunteer, only: [:show, :edit, :update, :destroy]

   def index
    params[:q] ||= Volunteer.ransack_default
    @volunteers = Volunteer.all
  end


  private

   def set_volunteer
    @volunteer = Volunteer.find(params[:id])
  end

  def volunteer_params
    params.require(:volunteer).permit(:name, :first_surname, :second_surname, :age, :id_number)
  end
end
