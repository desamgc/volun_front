class Rt::OthersController < ApplicationController
  before_filter :authenticate_user!
  respond_to :html, :js, :json

  def new
    @rt_other = Rt::Other.new
  end

  def create
    @rt_other = Rt::Other.new(rt_other_params)
    @rt_other.request_form.user_id = current_user.id
    if @rt_other.save
      redirect_to user_path(current_user), notice: t('other.response')
    else
      respond_with(@rt_other)
    end
  end

  protected

  def rt_other_params
    params.require(:rt_other).permit(:description, :user_id)
  end
end
