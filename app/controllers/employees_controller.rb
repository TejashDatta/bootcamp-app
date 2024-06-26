class EmployeesController < ApplicationController
  def index
    @search_params = search_params.to_h.symbolize_keys
    @search_errors = Employee.validate_search_params(search_params)
    return unless @search_errors.empty?

    @paginator = Paginator.new(Employee.search(search_params), params[:page])

    before_query_execution = Time.now
    @employees = @paginator.items.load
    after_query_execution = Time.now

    @query_execution_time = (after_query_execution - before_query_execution) * 1000
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
      redirect_to @employee,
                  notice: t("flash_messages.create_success", model: Employee.model_name.human)
    else
      render :new
    end
  end

  def update
    @employee = Employee.find(params[:id])

    if @employee.update(employee_params)
      redirect_to @employee,
                  notice: t("flash_messages.update_success", model: Employee.model_name.human)
    else
      render :edit
    end
  end

  def destroy
    Employee.find(params[:id]).destroy
    redirect_to employees_url,
                notice: t("flash_messages.destroy_success", model: Employee.model_name.human)
  end

  private

  def employee_params
    params.require(:employee).permit(:name, :date_of_joining, :department)
  end

  def search_params
    params.except(:page).permit(:name, :department, :date_of_joining)
  end
end
