# class for volunteer unsubscribe
class Rt::VolunteerUnsubscribesController < ApplicationController
  before_filter :authenticate_user!
  respond_to :html, :js, :json

  def index
  end

  def show
  end

  def new
    @rt_volunteer_unsubscribe = Rt::VolunteerUnsubscribe.new
  end

  def edit
  end

  def create
    @rt_volunteer_unsubscribe = Rt::VolunteerUnsubscribe.new(rt_volunteer_unsubscribe_params)
    @rt_volunteer_unsubscribe.request_form.user_id = current_user.id
    if @rt_volunteer_unsubscribe.save
      redirect_to index_i_projects_path, notice: t('rt_volunteer_unsubscribe.response')
    else
      respond_with(@rt_volunteer_unsubscribe)
    end
  end

  def update
  end

  def destroy
  end

  protected

  def rt_volunteer_unsubscribe_params
    params.require(:rt_volunteer_unsubscribe).permit(:volunteer_id, :level, :reason)
  end
end
