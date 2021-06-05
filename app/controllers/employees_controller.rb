class EmployeesController < ApplicationController
  def index
    @paginator = Paginator.new(Employee.search(search_params), params[:page])
    @search_params = search_params.to_h.symbolize_keys
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
    validate_date_of_joining
    params.permit(:name, :department, :date_of_joining)
  end

  def validate_date_of_joining
    return if params[:date_of_joining].blank? || params[:date_of_joining] =~ /\d{4}-\d{2}-\d{2}/

    flash.alert = "Incorrect date format yyyy-mm-dd"
    params[:date_of_joining] = nil
  end
end
