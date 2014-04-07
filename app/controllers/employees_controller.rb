class EmployeesController < ApplicationController
  skip_authorization_check 

  def hierarchy
    @employees = Employee.all.map{|e| {:id => e.id, :name => e.name, :designation => e.designation, :department => e.department, :manager => e.manager.present? ? e.manager : '', :avatar => e.avatar_url}}
    gon.employees = @employees
  end

  def create
    respond_to do |format|
      @employee = Employee.new(employee_params)
      @employee.save
      format.js
    end
  end

  def show
    @employee = Employee.find(params[:id])
    respond_to do |format|
      format.json do
        render :json => @employee
      end
      format.html
    end
  end

  def update
    @employee = Employee.find(params[:id])
    respond_to do |format|
      @employee.update(employee_params)
      format.js {
        render "create"
      }
    end
  end

  private

  def employee_params
    params.require(:employee).permit(:name, :designation, :department, :avatar, :manager)
  end

end
