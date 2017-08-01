require 'rails_helper'

RSpec.describe EntitiesController, type: :controller do

  let(:valid_attributes) {
    attributes_for :entity
  }

  let(:invalid_attributes) {
    attributes_for :entity, :invalid
  }


  describe "POST #create" do
    context 'with valid params' do
      it 'falla creates a new Rt::EntitySubscribe' do
        expect {
          post :create, entity: valid_attributes
        }.to change(Entity, :count).by(1)
      end

      it 'assigns a newly created rt_entity_subscribe as @rt_entity_subscribe' do
        post :create, entity: valid_attributes
        expect(assigns(:entity)).to be_a(Entity)
        expect(assigns(:entity)).to be_persisted
      end

      it 'falla redirects to the created rt_entity_subscribe' do
        post :create, entity: valid_attributes
        expect(response).to redirect_to entities_path
      end
    end

    context 'with invalid params' do
      it 'falla assigns a newly created but unsaved rt_entity_subscribe as @rt_entity_subscribe' do
        post :create, entity: invalid_attributes
        expect(assigns(:entity)).to be_a_new(Entity)
      end

      it 're-renders the "new" template' do
        post :create, entity: invalid_attributes
        expect(response).to render_template('new')
      end
    end
  end
end
