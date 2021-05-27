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
      redirect_to @project, notice: "プロジェクトの作成が合格しました。"
    else
      render :new
    end
  end

  def update
    @project = Project.find(params[:id])

    if @project.update(project_params)
      redirect_to @project, notice: "プロジェクトの更新が合格しました。"
    else
      render :edit
    end
  end

  def destroy
    Project.find(params[:id]).destroy
    redirect_to projects_url, notice: "プロジェクトの削除が合格しました。"
  end

  private

  def project_params
    # params[:project][:technology_ids].delete("")
    params.require(:project).permit(:name, :description, technology_ids: [])
  end
end
