class Rt::VolunteerUnsubscribesController < ApplicationController
  before_filter :authenticate_user!
  respond_to :html, :js, :json


  def new
    @rt_volunteer_unsubscribe = Rt::VolunteerUnsubscribe.new
    @rt_volunteer_unsubscribe.project_id = params[:project_id]
  end

  def create
    @rt_volunteer_unsubscribe = Rt::VolunteerUnsubscribe.new(rt_volunteer_unsubscribe_params)
    @rt_volunteer_unsubscribe.request_form.user_id = current_user.id
    if @rt_volunteer_unsubscribe.save
      redirect_to user_path(current_user), notice: t('volunteer_unsubscribe.response')
    else
      respond_with(@rt_volunteer_unsubscribe)
    end
  end


  protected

    def rt_volunteer_unsubscribe_params
      params.require(:rt_volunteer_unsubscribe).permit(:project_id, :unsubscribe_level_id, :notes)
    end
end
