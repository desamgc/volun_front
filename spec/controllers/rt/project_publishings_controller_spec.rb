require 'rails_helper'

RSpec.describe Rt::ProjectPublishingsController, type: :controller do
before(:each) do
    sign_in create(:user)
  end

  let(:valid_attributes) {
    attributes_for :project_publishing
  }

  let(:invalid_attributes) {
    attributes_for :project_publishing, :invalid
  }

  
  describe "POST #create" do
    context 'with valid params' do
      it 'falla creates a new Rt::ActivityPublishing' do
        expect {
          post :create, rt_project_publishing: valid_attributes
        }.to change(Rt::ProjectPublishing, :count).by(1)
      end

      it 'assigns a newly created rt_project_publishing as @rt_project_publishing' do
        post :create, rt_project_publishing: valid_attributes
        expect(assigns(:rt_project_publishing)).to be_a(Rt::ProjectPublishing)
        expect(assigns(:rt_project_publishing)).to be_persisted
      end

      it 'falla redirects to the created rt_activity_publishing' do
        post :create, rt_project_publishing: valid_attributes
        expect(response).to redirect_to index_i_projects_path 
      end
    end

    context 'with invalid params' do
      it 'falla assigns a newly created but unsaved rt_project_publishing as @rt_project_publishing' do
        post :create, rt_project_publishing: invalid_attributes
        expect(assigns(:rt_project_publishing)).to be_a_new(Rt::ProjectPublishing)
      end

      it 're-renders the "new" template' do
        post :create, rt_project_publishing: invalid_attributes
        expect(response).to render_template('new')
      end
    end
  end
end
