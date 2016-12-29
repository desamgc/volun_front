class RtOthersController < ApplicationController
  before_filter :authenticate_user!
  respond_to :html, :js, :json

  def index
  end

  def show
  end

  def new
    @rt_other = RtOther.new
  end

  def edit
  end

  def create
    @rt_other = RtOther.new(rt_other_params)
    @rt_other.build_request_form
    @rt_other.entity_id = current_user.profileable_id
    if @rt_other.save
      redirect_to projects_url, notice: t('rt_other.response')
    else
      respond_with(@rt_other)
    end
  end

  def update
  end

  def destroy
  end

  protected

  def rt_other_params
    params.require(:rt_other).permit(:description, :entity_id)
  end
end
