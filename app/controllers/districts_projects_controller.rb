class DistrictsProjectsController < ApplicationController
  before_action :set_districts_project, only: [:show, :edit, :update, :destroy]

  # GET /districts_projects
  # GET /districts_projects.json
  def index
    @districts_projects = DistrictsProject.all
  end

  # GET /districts_projects/1
  # GET /districts_projects/1.json
  def show
  end

  # GET /districts_projects/new
  def new
    @districts_project = DistrictsProject.new
  end

  # GET /districts_projects/1/edit
  def edit
  end

  # POST /districts_projects
  # POST /districts_projects.json
  def create
    @districts_project = DistrictsProject.new(districts_project_params)

    respond_to do |format|
      if @districts_project.save
        format.html { redirect_to @districts_project, notice: 'Districts project was successfully created.' }
        format.json { render :show, status: :created, location: @districts_project }
      else
        format.html { render :new }
        format.json { render json: @districts_project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /districts_projects/1
  # PATCH/PUT /districts_projects/1.json
  def update
    respond_to do |format|
      if @districts_project.update(districts_project_params)
        format.html { redirect_to @districts_project, notice: 'Districts project was successfully updated.' }
        format.json { render :show, status: :ok, location: @districts_project }
      else
        format.html { render :edit }
        format.json { render json: @districts_project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /districts_projects/1
  # DELETE /districts_projects/1.json
  def destroy
    @districts_project.destroy
    respond_to do |format|
      format.html { redirect_to districts_projects_url, notice: 'Districts project was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_districts_project
      @districts_project = DistrictsProject.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def districts_project_params
      params.require(:districts_project).permit(:district_id, :project_id)
    end
end
