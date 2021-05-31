class EmployeesController < ApplicationController
  def index
    @employees = Employee.all
    @employees = @employees.filter_by_name(search_params[:name]) if search_params[:name].present?
    @employees = @employees.filter_by_department(search_params[:department]) if search_params[:department].present?
  end

  def show
    @employee = Employee.find(params[:id])
  end

  def new
    @employee = Employee.new
  end

  def edit
    @employee = Employee.find(params[:id])
  end

  def create
    @employee = Employee.new(employee_params)

    if @employee.save
      redirect_to @employee, notice: "社員の作成が合格しました。"
    else
      render :new
    end
  end

  def update
    @employee = Employee.find(params[:id])

    if @employee.update(employee_params)
      redirect_to @employee, notice: "社員の更新が合格しました。"
    else
      render :edit
    end
  end

  def destroy
    Employee.find(params[:id]).destroy
    redirect_to employees_url, notice: "社員の削除が合格しました。"
  end

  private

  def employee_params
    params.require(:employee).permit(:name, :date_of_joining, :department)
  end

  def search_params
    params.permit(:name, :department)
  end
end
