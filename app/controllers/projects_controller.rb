class ProjectsController < ApplicationController
  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
  end

  def create
    project = Project.create(project_params)
    if project.save
      redirect_to projects_path, notice: 'Success! New project created.'
    else
      @project = Project.new
      flash[:error] = 'Oops! Please fix errors below.'
      render :new
    end
  end

  private

  def project_params
    params.require(:project).permit(:name, :description, :url, :tech)
  end
end

