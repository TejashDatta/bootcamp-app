 require 'rails_helper'

RSpec.describe "/employees", type: :request do
  include_context "uses authorized user with permissions"
  let(:controller_name) { "employees" }
  
  let(:valid_attributes) do
    {
      name: "John",
      date_of_joining: "2020-06-20",
      department: "Sales"
    }
  end

  let(:invalid_attributes) do
    {
      name: "",
      date_of_joining: "",
      department: ""
    }
  end

  let(:employee) { create(:employee) }

  describe "GET /index" do
    it "renders a successful response" do
      employee
      get employees_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      get employee_url(employee)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_employee_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "render a successful response" do
      get edit_employee_url(employee)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Employee" do
        expect {
          post employees_url, params: { employee: valid_attributes }
        }.to change(Employee, :count).by(1)
      end

      it "redirects to the created employee" do
        post employees_url, params: { employee: valid_attributes }
        expect(response).to redirect_to(employee_url(Employee.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Employee" do
        expect {
          post employees_url, params: { employee: invalid_attributes }
        }.to change(Employee, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post employees_url, params: { employee: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) { { name: "Smith" } }

      it "updates the requested employee" do
        patch employee_url(employee), params: { employee: new_attributes }
        employee.reload
        expect(employee.name).to eq("Smith")
      end

      it "redirects to the employee" do
        patch employee_url(employee), params: { employee: new_attributes }
        employee.reload
        expect(response).to redirect_to(employee_url(employee))
      end
    end

    context "with invalid parameters" do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        patch employee_url(employee), params: { employee: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested employee" do
      employee
      expect {
        delete employee_url(employee)
      }.to change(Employee, :count).by(-1)
    end

    it "redirects to the employees list" do
      delete employee_url(employee)
      expect(response).to redirect_to(employees_url)
    end
  end
end
