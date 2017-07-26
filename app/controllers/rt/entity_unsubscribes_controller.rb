class Rt::EntityUnsubscribesController < ApplicationController
  before_filter :authenticate_user!
  respond_to :html, :js, :json

  def new
    @rt_entity_unsubscribe = Rt::EntityUnsubscribe.new
  end

  def create
    @rt_entity_unsubscribe = Rt::EntityUnsubscribe.new(rt_entity_unsubscribe_params)
    @rt_entity_unsubscribe.request_form.user_id = current_user.id
    if @rt_entity_unsubscribe.save
      redirect_to user_path(current_user), notice: t('entity_unsubscribe.response')
    else
      respond_with(@rt_entity_unsubscribe)
    end
  end

  protected

    def rt_entity_unsubscribe_params
      params.require(:rt_entity_unsubscribe).permit(:user_id, :notes)
    end
end
