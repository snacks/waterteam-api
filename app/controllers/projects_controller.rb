class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update]
  # only project creator can destroy a project
  before_action :set_project_destroy, only: :destroy
  # before_action :set_creator, only: :create

  # GET /projects
  # GET /projects.json
  def index
    @projects = Project.all
    # @created_projects = current_user.created_projects.all 
    @user_projects = current_user.projects
    @user_associations = current_user.associations
    # @associations = Association.all
    # p "current user's projects: #{current_user.projects.inspect}"
    p "current user's created projects: #{current_user.created_projects.inspect}"
    p "and associations: #{@user_associations.inspect}"
    # p "all existing associations: #{@associations.inspect}"
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
  end

  # GET /projects/new
  def new
    @project = Project.new
  end

  # GET /projects/1/edit
  def edit
    @project = Project.find_by_id(params[:id])
    respond_to do |format|
      if @project.save
        format.html { redirect_to projects_url, notice: 'Project was successfully edited.' }
      end
    end
  end

  # POST /projects
  # POST /projects.json
  def create
    @project = Project.new(project_params)
    # assign creator to project (only user with permission to destroy)
    @project.creator_id = current_user.id
    # alternate way of saving user to project than below, this way can also assign creator boolean on join table
    @project.associations.new(user: current_user, creator: true)
    p "creator was #{@project.creator_id}"

    respond_to do |format|
      if @project.save
        # @project.users << current_user
        p "This user has #{current_user.projects.count} projects now"
        format.html { redirect_to projects_url, notice: 'Project was successfully created.' }
        # format.html { redirect_to @project, notice: 'Project was successfully created.' }
        format.json { render :show, status: :created, location: @project }
      else
        format.html { render :new }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  def update
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to @project, notice: 'Project was successfully updated.' }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project.destroy
    p "This user has #{current_user.projects.count} projects now"
    respond_to do |format|
      format.html { redirect_to projects_url, notice: 'Project was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # DELETE /projects
  def destroy_all
    @projects = Project.all
    @projects.delete_all
    render action: 'index'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      # We always want all projects visible, just not modifiable if not owner or member
      @project = Project.find_by_id(params[:id])
      p "Project selected: #{@project.inspect}"
    end

    def set_project_destroy
      @project = current_user.projects.find_by(creator_id: current_user.id)
      if @project.nil?
        p "param id: #{params[:id]}"
        redirect_to project_path(params[:id]), notice: "This is not your project to destroy."
      end
    end

    def set_creator
      project_params[:creator_id] = current_user.id
      Rails.logger.debug project_params
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_params
      params.fetch(:project, {}).permit(:name)
    end
end
