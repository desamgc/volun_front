require 'rails_helper'

RSpec.describe Rt::ActivityUnpublishingsController, type: :controller do
before(:each) do
    sign_in create(:user)
  end

  let(:valid_attributes) {
    attributes_for :activity_unpublishing
  }

  let(:invalid_attributes) {
    attributes_for :activity_unpublishing, :invalid
  }

  
  describe "POST #create" do
    context 'with valid params' do
      it 'falla creates a new Rt::ActivityPublishing' do
        expect {
          post :create, rt_activity_unpublishing: valid_attributes
        }.to change(Rt::ActivityUnpublishing, :count).by(1)
      end

      it 'assigns a newly created rt_activity_unpublishing as @rt_activity_unpublishing' do
        post :create, rt_activity_unpublishing: valid_attributes
        expect(assigns(:rt_activity_unpublishing)).to be_a(Rt::ActivityUnpublishing)
        expect(assigns(:rt_activity_unpublishing)).to be_persisted
      end

      it 'falla redirects to the created rt_activity_unpublishing' do
        post :create, rt_activity_unpublishing: valid_attributes
        expect(response).to redirect_to index_i_projects_path 
      end
    end

    context 'with invalid params' do
      it 'falla assigns a newly created but unsaved rt_activity_unpublishing as @rt_activity_unpublishing' do
        post :create, rt_activity_unpublishing: invalid_attributes
        expect(assigns(:rt_activity_unpublishing)).to be_a_new(Rt::ActivityUnpublishing)
      end

      it 're-renders the "new" template' do
        post :create, rt_activity_unpublishing: invalid_attributes
        expect(response).to render_template('new')
      end
    end
  end
end
