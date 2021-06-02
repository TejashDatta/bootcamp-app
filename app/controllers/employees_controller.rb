class EmployeesController < ApplicationController
  def index
    @employee_search = EmployeeSearch.new(search_params)
    paginator = Paginator.new(@employee_search.search, params[:page])
    @page = paginator.page
    @last_page = paginator.last_page
    @employees = paginator.items
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
    params
      .fetch(:employee_search, {})
      .permit(:name, :department, :date_of_joining_lower_limit, :date_of_joining_upper_limit)
  end
end
