class ProjectsController < ApplicationController
  before_action :require_admin, except: :index

  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.create(project_params)

    if @project.save
      redirect_to projects_path, notice: 'Success! New project created.'
    else
      flash.now[:error] = 'Oops! Please fix the errors below.'
      render :new
    end
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])
    if @project.update(project_params)
      redirect_to projects_path, notice: 'Success! Project updated.'
    else
      flash.now[:error] = 'Oops! Please fix the errors below.'
      render :edit
    end
  end

  def destroy
    project = Project.find(params[:id])
    project.destroy
    redirect_to projects_path, notice: 'Success! Project deleted.'
  end

  private

  def project_params
    params.require(:project).permit(:name, :description, :url, :tech, :image)
  end
end
