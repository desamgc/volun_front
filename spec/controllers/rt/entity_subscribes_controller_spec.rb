require 'rails_helper'

RSpec.describe Rt::EntitySubscribesController, type: :controller do
  before(:each) do
    sign_in create(:user)
  end

  let(:valid_attributes) {
    attributes_for :entity_subscribe
  }

  let(:invalid_attributes) {
    attributes_for :entity_subscribe, :invalid
  }

  
  describe "POST #create" do
    context 'with valid params' do
      it 'falla creates a new Rt::EntitySubscribe' do
        expect {
          post :create, rt_entity_subscribe: valid_attributes
        }.to change(Rt::EntitySubscribe, :count).by(1)
      end

      it 'assigns a newly created rt_entity_subscribe as @rt_entity_subscribe' do
        post :create, rt_entity_subscribe: valid_attributes
        expect(assigns(:rt_entity_subscribe)).to be_a(Rt::EntitySubscribe)
        expect(assigns(:rt_entity_subscribe)).to be_persisted
      end

      it 'falla redirects to the created rt_entity_subscribe' do
        post :create, rt_entity_subscribe: valid_attributes
        expect(response).to redirect_to index_i_projects_path 
      end
    end

    context 'with invalid params' do
      it 'falla assigns a newly created but unsaved rt_entity_subscribe as @rt_entity_subscribe' do
        post :create, rt_entity_subscribe: invalid_attributes
        expect(assigns(:rt_entity_subscribe)).to be_a_new(Rt::EntitySubscribe)
      end

      it 're-renders the "new" template' do
        post :create, rt_entity_subscribe: invalid_attributes
        expect(response).to render_template('new')
      end
    end
  end
end
