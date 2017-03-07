require 'rails_helper'

RSpec.describe Rt::VolunteerSubscribesController, type: :controller do
  before(:each) do
    sign_in create(:user)
  end

  let(:valid_attributes) {
    attributes_for :volunteer_subscribe
  }

  let(:invalid_attributes) {
    attributes_for :volunteer_subscribe, :invalid
  }

  describe "GET #index" do
    it 'assigns all rt_volunteer_subscribes as @rt_volunteer_subscribes' do
      volunteer_subscribe = Rt::VolunteerSubscribe.create! valid_attributes
      get :index
      expect(assigns(:rt_volunteer_subscribes)).to eq([volunteer_subscribe])
    end
  end

  describe "GET #show" do
    it 'assigns the requested rt_volunteer_subscribe as @rt_volunteer_subscribe' do
      volunteer_subscribe = Rt::VolunteerSubscribe.create! valid_attributes
      get :show, id: volunteer_subscribe.to_param
      expect(assigns(:rt_volunteer_subscribe)).to eq(volunteer_subscribe)
    end
  end

  describe "GET #new" do
    it 'assigns a new rt_volunteer_subscribe as @rt_volunteer_subscribe' do
      get :new
      expect(assigns(:rt_volunteer_subscribe)).to be_a_new(Rt::VolunteerSubscribe)
    end
  end

  describe "GET #edit" do
    it 'assigns the requested rt_volunteer_subscribe as @rt_volunteer_subscribe' do
      volunteer_subscribe = Rt::VolunteerSubscribe.create! valid_attributes
      get :edit, id: volunteer_subscribe.to_param
      expect(assigns(:rt_volunteer_subscribe)).to eq(volunteer_subscribe)
    end
  end

  describe "POST #create" do
    context 'with valid params' do
      it 'creates a new Rt::VolunteerSubscribe' do
        expect {
          post :create, rt_volunteer_subscribe: valid_attributes
        }.to change(Rt::VolunteerSubscribe, :count).by(1)
      end

      it 'assigns a newly created rt_volunteer_subscribe as @rt_volunteer_subscribe' do
        post :create, rt_volunteer_subscribe: valid_attributes
        expect(assigns(:rt_volunteer_subscribe)).to be_a(Rt::VolunteerSubscribe)
        expect(assigns(:rt_volunteer_subscribe)).to be_persisted
      end

      it 'redirects to the created rt_volunteer_subscribe' do
        post :create, rt_volunteer_subscribe: valid_attributes
        expect(response).to redirect_to(rt_volunteer_subscribes_url)
      end
    end

    context 'with invalid params' do
      it 'assigns a newly created but unsaved rt_volunteer_subscribe as @rt_volunteer_subscribe' do
        post :create, rt_volunteer_subscribe: invalid_attributes
        expect(assigns(:rt_volunteer_subscribe)).to be_a_new(Rt::VolunteerSubscribe)
      end

      it 're-renders the "new" template' do
        post :create, rt_volunteer_subscribe: invalid_attributes
        expect(response).to render_template('new')
      end
    end
  end

  describe "PUT #update" do
    context 'with valid params' do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it 'updates the requested rt_volunteer_subscribe' do
        volunteer_subscribe = Rt::VolunteerSubscribe.create! valid_attributes
        put :update, id: volunteer_subscribe.to_param, rt_volunteer_subscribe: new_attributes
        volunteer_subscribe.reload
        skip("Add assertions for updated state")
      end

      it 'assigns the requested rt_volunteer_subscribe as @rt_volunteer_subscribe' do
        volunteer_subscribe = Rt::VolunteerSubscribe.create! valid_attributes
        put :update, id: volunteer_subscribe.to_param, rt_volunteer_subscribe: valid_attributes
        expect(assigns(:rt_volunteer_subscribe)).to eq(volunteer_subscribe)
      end

      it 'redirects to rt_volunteer_subscribes' do
        volunteer_subscribe = Rt::VolunteerSubscribe.create! valid_attributes
        put :update, id: volunteer_subscribe.to_param, rt_volunteer_subscribe: valid_attributes
        expect(response).to redirect_to(rt_volunteer_subscribes_url)
      end
    end

    context 'with invalid params' do
      it 'assigns the rt_volunteer_subscribe as @rt_volunteer_subscribe' do
        volunteer_subscribe = Rt::VolunteerSubscribe.create! valid_attributes
        put :update, id: volunteer_subscribe.to_param, rt_volunteer_subscribe: invalid_attributes
        expect(assigns(:rt_volunteer_subscribe)).to eq(volunteer_subscribe)
      end

      it 're-renders the "edit" template' do
        volunteer_subscribe = Rt::VolunteerSubscribe.create! valid_attributes
        put :update, id: volunteer_subscribe.to_param, rt_volunteer_subscribe: invalid_attributes
        expect(response).to render_template('edit')
      end
    end
  end

  describe "DELETE #destroy" do
    it 'destroys the requested rt_volunteer_subscribe' do
      volunteer_subscribe = Rt::VolunteerSubscribe.create! valid_attributes
      expect {
        delete :destroy, id: volunteer_subscribe.to_param
      }.to change(Rt::VolunteerSubscribe, :count).by(volunteer_subscribe.respond_to?(:archived?) ? 0 : -1)
    end

    it 'redirects to the rt_volunteer_subscribes list' do
      volunteer_subscribe = Rt::VolunteerSubscribe.create! valid_attributes
      delete :destroy, id: volunteer_subscribe.to_param
      expect(response).to redirect_to(rt_volunteer_subscribes_url)
    end
  end

end
