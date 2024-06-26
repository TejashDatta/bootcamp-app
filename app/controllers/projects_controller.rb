class ProjectsController < ApplicationController
  def index
    @projects = Project.all
  end

  def show
    @project = Project.find(params[:id])
  end

  def new
    @project = Project.new
  end

  def edit
    @project = Project.find(params[:id])
  end

  def create
    @project = Project.new(project_params)

    if @project.save
      redirect_to @project,
                  notice: t("flash_messages.create_success", model: Project.model_name.human)
    else
      render :new
    end
  end

  def update
    @project = Project.find(params[:id])

    if @project.update(project_params)
      redirect_to @project,
                  notice: t("flash_messages.update_success", model: Project.model_name.human)
    else
      render :edit
    end
  end

  def destroy
    Project.find(params[:id]).destroy
    redirect_to projects_url,
                notice: t("flash_messages.delete_success", model: Project.model_name.human)
  end

  private

  def project_params
    params.require(:project).permit(:name, :description, technology_ids: [])
  end
end
