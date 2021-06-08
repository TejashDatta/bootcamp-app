class EmployeesController < ApplicationController
  def index
    @search_params = search_params.to_h.symbolize_keys
    @search_errors = Employee.validate_search_params(search_params)
    @paginator = Paginator.new(
      @search_errors.empty? ? Employee.search(search_params) : Employee.none,
      params[:page]
    )
    @employees = @paginator.items
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
    params.except(:page).permit(:name, :department, :date_of_joining)
  end
end
