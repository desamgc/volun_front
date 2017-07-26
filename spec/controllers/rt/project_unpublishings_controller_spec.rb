require 'rails_helper'

RSpec.describe Rt::ProjectUnpublishingsController, type: :controller do
  let(:user) { create(:user, :user_entity) }
  before(:each) do
    sign_in user
  end

  let(:valid_attributes) {
    @project = create(:project)
    attributes_for :project_unpublishing, project_id: @project.id

  }

  let(:invalid_attributes) {
    attributes_for :project_unpublishing
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
        expect(response).to redirect_to user_path(user)
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
