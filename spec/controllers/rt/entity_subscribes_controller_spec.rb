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

  describe "GET #index" do
    it 'assigns all rt_entity_subscribes as @rt_entity_subscribes' do
      entity_subscribe = Rt::EntitySubscribe.create! valid_attributes
      get :index
      expect(assigns(:rt_entity_subscribes)).to eq([entity_subscribe])
    end
  end

  describe "GET #show" do
    it 'assigns the requested rt_entity_subscribe as @rt_entity_subscribe' do
      entity_subscribe = Rt::EntitySubscribe.create! valid_attributes
      get :show, id: entity_subscribe.to_param
      expect(assigns(:rt_entity_subscribe)).to eq(entity_subscribe)
    end
  end

  describe "GET #new" do
    it 'assigns a new rt_entity_subscribe as @rt_entity_subscribe' do
      get :new
      expect(assigns(:rt_entity_subscribe)).to be_a_new(Rt::EntitySubscribe)
    end
  end

  describe "GET #edit" do
    it 'assigns the requested rt_entity_subscribe as @rt_entity_subscribe' do
      entity_subscribe = Rt::EntitySubscribe.create! valid_attributes
      get :edit, id: entity_subscribe.to_param
      expect(assigns(:rt_entity_subscribe)).to eq(entity_subscribe)
    end
  end

  describe "POST #create" do
    context 'with valid params' do
      it 'creates a new Rt::EntitySubscribe' do
        expect {
          post :create, rt_entity_subscribe: valid_attributes
        }.to change(Rt::EntitySubscribe, :count).by(1)
      end

      it 'assigns a newly created rt_entity_subscribe as @rt_entity_subscribe' do
        post :create, rt_entity_subscribe: valid_attributes
        expect(assigns(:rt_entity_subscribe)).to be_a(Rt::EntitySubscribe)
        expect(assigns(:rt_entity_subscribe)).to be_persisted
      end

      it 'redirects to the created rt_entity_subscribe' do
        post :create, rt_entity_subscribe: valid_attributes
        expect(response).to redirect_to(rt_entity_subscribes_url)
      end
    end

    context 'with invalid params' do
      it 'assigns a newly created but unsaved rt_entity_subscribe as @rt_entity_subscribe' do
        post :create, rt_entity_subscribe: invalid_attributes
        expect(assigns(:rt_entity_subscribe)).to be_a_new(Rt::EntitySubscribe)
      end

      it 're-renders the "new" template' do
        post :create, rt_entity_subscribe: invalid_attributes
        expect(response).to render_template('new')
      end
    end
  end

  describe "PUT #update" do
    context 'with valid params' do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it 'updates the requested rt_entity_subscribe' do
        entity_subscribe = Rt::EntitySubscribe.create! valid_attributes
        put :update, id: entity_subscribe.to_param, rt_entity_subscribe: new_attributes
        entity_subscribe.reload
        skip("Add assertions for updated state")
      end

      it 'assigns the requested rt_entity_subscribe as @rt_entity_subscribe' do
        entity_subscribe = Rt::EntitySubscribe.create! valid_attributes
        put :update, id: entity_subscribe.to_param, rt_entity_subscribe: valid_attributes
        expect(assigns(:rt_entity_subscribe)).to eq(entity_subscribe)
      end

      it 'redirects to rt_entity_subscribes' do
        entity_subscribe = Rt::EntitySubscribe.create! valid_attributes
        put :update, id: entity_subscribe.to_param, rt_entity_subscribe: valid_attributes
        expect(response).to redirect_to(rt_entity_subscribes_url)
      end
    end

    context 'with invalid params' do
      it 'assigns the rt_entity_subscribe as @rt_entity_subscribe' do
        entity_subscribe = Rt::EntitySubscribe.create! valid_attributes
        put :update, id: entity_subscribe.to_param, rt_entity_subscribe: invalid_attributes
        expect(assigns(:rt_entity_subscribe)).to eq(entity_subscribe)
      end

      it 're-renders the "edit" template' do
        entity_subscribe = Rt::EntitySubscribe.create! valid_attributes
        put :update, id: entity_subscribe.to_param, rt_entity_subscribe: invalid_attributes
        expect(response).to render_template('edit')
      end
    end
  end

  describe "DELETE #destroy" do
    it 'destroys the requested rt_entity_subscribe' do
      entity_subscribe = Rt::EntitySubscribe.create! valid_attributes
      expect {
        delete :destroy, id: entity_subscribe.to_param
      }.to change(Rt::EntitySubscribe, :count).by(entity_subscribe.respond_to?(:archived?) ? 0 : -1)
    end

    it 'redirects to the rt_entity_subscribes list' do
      entity_subscribe = Rt::EntitySubscribe.create! valid_attributes
      delete :destroy, id: entity_subscribe.to_param
      expect(response).to redirect_to(rt_entity_subscribes_url)
    end
  end

end
