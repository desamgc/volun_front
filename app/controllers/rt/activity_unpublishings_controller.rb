class Rt::ActivityUnpublishingsController < ApplicationController
  before_filter :authenticate_user!
  respond_to :html, :js, :json

  def new
    @rt_activity_unpublishing = Rt::ActivityUnpublishing.new
    @rt_activity_unpublishing.activity = params[:activity_id]
  end

  def create
    @rt_activity_unpublishing = Rt::ActivityUnpublishing.new(rt_activity_unpublishing_params)
    @rt_activity_unpublishing.request_form.user_id = current_user.id
    if @rt_activity_unpublishing.save
      redirect_to user_path(current_user), notice: t('activity_unpublishing.response')
    else
      respond_with(@rt_activity_unpublishing)
    end
  end

  protected

  def rt_activity_unpublishing_params
    params.require(:rt_activity_unpublishing).permit(:notes, :activity_id)
  end
end
