require 'rails_helper'

RSpec.describe "/projects", type: :request do
  include_context "uses authorized user with permissions"
  let(:permitted_actions_filter) { "projects" }

  let(:project) { create(:project) }
  
  let(:valid_attributes) do
    {
      name: "project 1",
      description: "",
      technology_ids: [create(:technology).id, create(:technology).id]
    }
  end

  let(:invalid_attributes) do
    {
      name: "",
      description: "",
      technology_ids: []
    }
  end

  describe "GET /index" do
    it "renders a successful response" do
      project
      get projects_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      get project_url(project)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_project_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "render a successful response" do
      get edit_project_url(project)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Project" do
        expect {
          post projects_url, params: { project: valid_attributes }
        }.to change(Project, :count).by(1)
      end

      it "redirects to the created project" do
        post projects_url, params: { project: valid_attributes }
        expect(response).to redirect_to(project_url(Project.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Project" do
        expect {
          post projects_url, params: { project: invalid_attributes }
        }.to change(Project, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post projects_url, params: { project: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) { { description: "patch project" } }

      it "updates the requested project" do
        patch project_url(project), params: { project: new_attributes }
        project.reload
        expect(project.description).to eq("patch project")
      end

      it "redirects to the project" do
        patch project_url(project), params: { project: new_attributes }
        project.reload
        expect(response).to redirect_to(project_url(project))
      end
    end

    context "with invalid parameters" do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        patch project_url(project), params: { project: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested project" do
      project
      expect {
        delete project_url(project)
      }.to change(Project, :count).by(-1)
    end

    it "redirects to the projects list" do
      project
      delete project_url(project)
      expect(response).to redirect_to(projects_url)
    end
  end
end
