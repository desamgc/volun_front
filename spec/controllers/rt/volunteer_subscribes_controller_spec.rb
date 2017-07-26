require 'rails_helper'

RSpec.describe Rt::VolunteerSubscribesController, type: :controller do
  before :each do
    sign_out :user
  end

  let(:valid_attributes) {
    attributes_for :volunteer_subscribe

  }

  let(:invalid_attributes) {
    attributes_for :volunteer_subscribe, :invalid
  }

  describe "GET #new" do
    it 'assigns a new rt_volunteer_subscribe as @rt_volunteer_subscribe' do
      get :new
      expect(assigns(:rt_volunteer_subscribe)).to be_a_new(Rt::VolunteerSubscribe)
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
        expect(response).to redirect_to projects_path
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
end
