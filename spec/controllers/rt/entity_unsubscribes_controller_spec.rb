require 'rails_helper'

RSpec.describe Rt::EntityUnsubscribesController, type: :controller do
  before(:each) do
    sign_in create(:user)
  end

  let(:valid_attributes) {
    attributes_for :entity_unsubscribe
  }

  let(:invalid_attributes) {
    attributes_for :entity_unsubscribe, :invalid
  }

  describe "GET #index" do
    it 'assigns all rt_entity_unsubscribes as @rt_entity_unsubscribes' do
      entity_unsubscribe = Rt::EntityUnsubscribe.create! valid_attributes
      get :index
      expect(assigns(:rt_entity_unsubscribes)).to eq([entity_unsubscribe])
    end
  end

  describe "GET #show" do
    it 'assigns the requested rt_entity_unsubscribe as @rt_entity_unsubscribe' do
      entity_unsubscribe = Rt::EntityUnsubscribe.create! valid_attributes
      get :show, id: entity_unsubscribe.to_param
      expect(assigns(:rt_entity_unsubscribe)).to eq(entity_unsubscribe)
    end
  end

  describe "GET #new" do
    it 'assigns a new rt_entity_unsubscribe as @rt_entity_unsubscribe' do
      get :new
      expect(assigns(:rt_entity_unsubscribe)).to be_a_new(Rt::EntityUnsubscribe)
    end
  end

  describe "GET #edit" do
    it 'assigns the requested rt_entity_unsubscribe as @rt_entity_unsubscribe' do
      entity_unsubscribe = Rt::EntityUnsubscribe.create! valid_attributes
      get :edit, id: entity_unsubscribe.to_param
      expect(assigns(:rt_entity_unsubscribe)).to eq(entity_unsubscribe)
    end
  end

  describe "POST #create" do
    context 'with valid params' do
      it 'creates a new Rt::EntityUnsubscribe' do
        expect {
          post :create, rt_entity_unsubscribe: valid_attributes
        }.to change(Rt::EntityUnsubscribe, :count).by(1)
      end

      it 'assigns a newly created rt_entity_unsubscribe as @rt_entity_unsubscribe' do
        post :create, rt_entity_unsubscribe: valid_attributes
        expect(assigns(:rt_entity_unsubscribe)).to be_a(Rt::EntityUnsubscribe)
        expect(assigns(:rt_entity_unsubscribe)).to be_persisted
      end

      it 'redirects to the created rt_entity_unsubscribe' do
        post :create, rt_entity_unsubscribe: valid_attributes
        expect(response).to redirect_to(rt_entity_unsubscribes_url)
      end
    end

    context 'with invalid params' do
      it 'assigns a newly created but unsaved rt_entity_unsubscribe as @rt_entity_unsubscribe' do
        post :create, rt_entity_unsubscribe: invalid_attributes
        expect(assigns(:rt_entity_unsubscribe)).to be_a_new(Rt::EntityUnsubscribe)
      end

      it 're-renders the "new" template' do
        post :create, rt_entity_unsubscribe: invalid_attributes
        expect(response).to render_template('new')
      end
    end
  end

  describe "PUT #update" do
    context 'with valid params' do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it 'updates the requested rt_entity_unsubscribe' do
        entity_unsubscribe = Rt::EntityUnsubscribe.create! valid_attributes
        put :update, id: entity_unsubscribe.to_param, rt_entity_unsubscribe: new_attributes
        entity_unsubscribe.reload
        skip("Add assertions for updated state")
      end

      it 'assigns the requested rt_entity_unsubscribe as @rt_entity_unsubscribe' do
        entity_unsubscribe = Rt::EntityUnsubscribe.create! valid_attributes
        put :update, id: entity_unsubscribe.to_param, rt_entity_unsubscribe: valid_attributes
        expect(assigns(:rt_entity_unsubscribe)).to eq(entity_unsubscribe)
      end

      it 'redirects to rt_entity_unsubscribes' do
        entity_unsubscribe = Rt::EntityUnsubscribe.create! valid_attributes
        put :update, id: entity_unsubscribe.to_param, rt_entity_unsubscribe: valid_attributes
        expect(response).to redirect_to(rt_entity_unsubscribes_url)
      end
    end

    context 'with invalid params' do
      it 'assigns the rt_entity_unsubscribe as @rt_entity_unsubscribe' do
        entity_unsubscribe = Rt::EntityUnsubscribe.create! valid_attributes
        put :update, id: entity_unsubscribe.to_param, rt_entity_unsubscribe: invalid_attributes
        expect(assigns(:rt_entity_unsubscribe)).to eq(entity_unsubscribe)
      end

      it 're-renders the "edit" template' do
        entity_unsubscribe = Rt::EntityUnsubscribe.create! valid_attributes
        put :update, id: entity_unsubscribe.to_param, rt_entity_unsubscribe: invalid_attributes
        expect(response).to render_template('edit')
      end
    end
  end

  describe "DELETE #destroy" do
    it 'destroys the requested rt_entity_unsubscribe' do
      entity_unsubscribe = Rt::EntityUnsubscribe.create! valid_attributes
      expect {
        delete :destroy, id: entity_unsubscribe.to_param
      }.to change(Rt::EntityUnsubscribe, :count).by(entity_unsubscribe.respond_to?(:archived?) ? 0 : -1)
    end

    it 'redirects to the rt_entity_unsubscribes list' do
      entity_unsubscribe = Rt::EntityUnsubscribe.create! valid_attributes
      delete :destroy, id: entity_unsubscribe.to_param
      expect(response).to redirect_to(rt_entity_unsubscribes_url)
    end
  end

end
