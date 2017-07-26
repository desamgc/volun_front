class UsersController < ApplicationController
  before_filter :authenticate_user!
  respond_to :html, :js, :json

  def index
    params[:q] ||= User.ransack_default
    @search_q = @users.search(params[:q])
    @users = @search_q.result.paginate(page: params[:page], per_page: params[:per_page]||15)

    respond_with(@users)
  end



  def new
    @user = User.new
    respond_with(@user)
  end

  def edit
     @resource = User.find_by_id (current_user.id)
     render 'users/edit', locals: {resource: @resource}
  end

  def create
    @user.save
    respond_with(@user)
  end

  def update
    @user.update_attributes(user_params)
    respond_with(@user)
  end

  def destroy
    @user.destroy
    respond_with(@user)
  end

  def show
    load_available_activity if valid_access?
  end


  def search_activities
     load_activities
     respond_to do |format|
      format.html
      format.js {render :action => 'activities.js.erb'}
    end
  end

  def search_projects
    load_projects
    respond_to do |format|
      format.html
      format.js {render :action => 'projects.js.erb'}
    end
  end



  protected

    def user_params
      params.require(:user).permit(:locale, :profileable_id)
    end

    def load_available_activity
        load_projects
        #load_activities
    end

    def load_projects
      if current_user.loggable_type == 'Entity'
        params[:q] = {entity_id_eq: current_user.loggable_id}
      else
        params[:q] = {volunteers_id_in: current_user.loggable_id}
      end
      @search = Project.unscoped.includes(:areas,:entity).search(params[:q])
      @projects_actives = @search.result
    end

    def load_activities
      params[:q] = {entity_id_eq: current_user.loggable_id}
      @search_q = Activity.unscoped.search(params[:q])
      @activities = @search_q.result
    end


    def valid_access?
      authorized_current_user?
    end

    def authorized_current_user?
      @authorized_current_user ||= current_user
    end


end