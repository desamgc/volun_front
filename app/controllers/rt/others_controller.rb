class Rt::OthersController < ApplicationController
  before_filter :authenticate_user!
  respond_to :html, :js, :json

  def index
  end

  def show
  end

  def new
    @rt_other = Other.new
  end

  def edit
  end

  def create
    @rt_other = Other.new(rt_other_params)
    @rt_other.request_form.user_id = current_user.id
    if @rt_other.save
      redirect_to index_i_projects_path, notice: t('rt_other.response')
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
