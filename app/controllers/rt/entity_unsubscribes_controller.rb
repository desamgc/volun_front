class Rt::EntityUnsubscribesController < ApplicationController
  before_filter :authenticate_user!
  respond_to :html, :js, :json

  def index
    params[:q] ||= Rt::EntityUnsubscribe.ransack_default
    @search_q = @rt_entity_unsubscribes.search(params[:q])
    @rt_entity_unsubscribes = @search_q.result.paginate(page: params[:page], per_page: params[:per_page]||15)

    respond_with(@rt_entity_unsubscribes)
  end

  def show
    respond_with(@rt_entity_unsubscribe) do |format|
      format.js { render 'shared/popup' }
    end
  end

  def new
    @rt_entity_unsubscribe = Rt::EntityUnsubscribe.new
  end

  def edit
  end

  def create
    @rt_entity_unsubscribe = Rt::EntityUnsubscribe.new(rt_entity_unsubscribe_params)
    @rt_entity_unsubscribe.request_form.user_id = current_user.id
    if @rt_entity_unsubscribe.save
      redirect_to index_i_projects_path, notice: t('rt_entity_unsubscribe.response')
    else
      respond_with(@rt_entity_unsubscribe)
    end
  end

  def update
    @rt_entity_unsubscribe.update_attributes(rt_entity_unsubscribe_params)
    respond_with(@rt_entity_unsubscribe)
  end

  def destroy
    @rt_entity_unsubscribe.destroy
    respond_with(@rt_entity_unsubscribe)
  end

  protected

    def rt_entity_unsubscribe_params
      params.require(:rt_entity_unsubscribe).permit(:user_id, :notes)
    end
end
