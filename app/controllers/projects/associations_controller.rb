class Projects::AssociationsController < ApplicationController
  before_action :set_project
  before_action :set_current_user # this allows current_user alias Current.user to be used in the Association model

  def create
    p association_params
    invited_user = @project.associations.new(association_params)
    invited_user.project = @project

    if invited_user.save
      redirect_to @project, notice: 'Saved!'
    else
      p "This user could not be saved: #{invited_user.inspect}"
      redirect_to @project, alert: 'Failed saving!'
    end
  end

  private

  def set_project
    @project = current_user.projects.find(params[:project_id])
  end

  def association_params
    params.require(:association).permit(:email)
  end

end