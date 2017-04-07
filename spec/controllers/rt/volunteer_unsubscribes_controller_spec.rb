require 'rails_helper'

RSpec.describe Rt::VolunteerUnsubscribesController, type: :controller do
  before(:each) do
    sign_in create(:user)
  end

  let(:valid_attributes) {
    attributes_for :volunteer_unsubscribe
  }

  let(:invalid_attributes) {
    attributes_for :volunteer_unsubscribe, :invalid
  }

  describe "GET #new" do
    it 'assigns a new rt_volunteer_unsubscribe as @rt_volunteer_unsubscribe' do
      get :new
      expect(assigns(:rt_volunteer_unsubscribe)).to be_a_new(Rt::VolunteerUnsubscribe)
    end
  end
  
  describe "POST #create" do
    context 'with valid params' do
      it 'creates a new Rt::VolunteerUnsubscribe' do
        expect {
          post :create, rt_volunteer_unsubscribe: valid_attributes
        }.to change(Rt::VolunteerUnsubscribe, :count).by(1)
      end

      it 'assigns a newly created rt_volunteer_unsubscribe as @rt_volunteer_unsubscribe' do
        post :create, rt_volunteer_unsubscribe: valid_attributes
        expect(assigns(:rt_volunteer_unsubscribe)).to be_a(Rt::VolunteerUnsubscribe)
        expect(assigns(:rt_volunteer_unsubscribe)).to be_persisted
      end

      it 'redirects to the created rt_volunteer_unsubscribe' do
        post :create, rt_volunteer_unsubscribe: valid_attributes
        expect(response).to redirect_to index_i_projects_path
      end
    end

    context 'with invalid params' do
      it 'assigns a newly created but unsaved rt_volunteer_unsubscribe as @rt_volunteer_unsubscribe' do
        post :create, rt_volunteer_unsubscribe: invalid_attributes
        expect(assigns(:rt_volunteer_unsubscribe)).to be_a_new(Rt::VolunteerUnsubscribe)
      end

      it 're-renders the "new" template' do
        post :create, rt_volunteer_unsubscribe: invalid_attributes
        expect(response).to render_template('new')
      end
    end
  end
end
