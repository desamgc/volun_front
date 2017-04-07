require 'rails_helper'

RSpec.describe Rt::ProjectUnpublishingsController, type: :controller do
before(:each) do
    sign_in create(:user)
  end

  let(:valid_attributes) {
    attributes_for :project_unpublishing
  }

  let(:invalid_attributes) {
    attributes_for :project_unpublishing, :invalid
  }

  
  describe "POST #create" do
    context 'with valid params' do
      it 'falla creates a new Rt::ProjectUnPublishing' do
        expect {
          post :create, rt_project_unpublishing: valid_attributes
        }.to change(Rt::ProjectUnpublishing, :count).by(1)
      end

      it 'assigns a newly created rt_project_unpublishing as @rt_project_unpublishing' do
        post :create, rt_project_unpublishing: valid_attributes
        expect(assigns(:rt_project_unpublishing)).to be_a(Rt::ProjectUnpublishing)
        expect(assigns(:rt_project_unpublishing)).to be_persisted
      end

      it 'falla redirects to the created rt_project_unpublishing' do
        post :create, rt_project_unpublishing: valid_attributes
        expect(response).to redirect_to index_i_projects_path 
      end
    end

    context 'with invalid params' do
      it 'falla assigns a newly created but unsaved rt_project_unpublishing as @rt_project_unpublishing' do
        post :create, rt_project_unpublishing: invalid_attributes
        expect(assigns(:rt_project_unpublishing)).to be_a_new(Rt::ProjectUnpublishing)
      end

      it 're-renders the "new" template' do
        post :create, rt_project_unpublishing: invalid_attributes
        expect(response).to render_template('new')
      end
    end
  end
end
