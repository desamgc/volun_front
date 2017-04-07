require 'rails_helper'

RSpec.describe Rt::VolunteerAmendmentsController, type: :controller do
  before(:each) do
    sign_in create(:user)
  end

  let(:valid_attributes) {
    attributes_for :volunteer_amendment
  }

  let(:invalid_attributes) {
    attributes_for :volunteer_amendment, :invalid
  }

  
  describe "GET #new" do
    it 'assigns a new rt_volunteer_amendment as @rt_volunteer_amendment' do
      get :new
      expect(assigns(:rt_volunteer_amendment)).to be_a_new(Rt::VolunteerAmendment)
    end
  end

  describe "POST #create" do
    context 'with valid params' do
      it 'creates a new Rt::VolunteerAmendment' do
        expect {
          post :create, rt_volunteer_amendment: valid_attributes
        }.to change(Rt::VolunteerAmendment, :count).by(1)
      end

      it 'assigns a newly created rt_volunteer_amendment as @rt_volunteer_amendment' do
        post :create, rt_volunteer_amendment: valid_attributes
        expect(assigns(:rt_volunteer_amendment)).to be_a(Rt::VolunteerAmendment)
        expect(assigns(:rt_volunteer_amendment)).to be_persisted
      end

      it 'redirects to the created rt_volunteer_amendment' do
        post :create, rt_volunteer_amendment: valid_attributes
        expect(response).to redirect_to index_i_projects_path
      end
    end

    context 'with invalid params' do
      it 'assigns a newly created but unsaved rt_volunteer_amendment as @rt_volunteer_amendment' do
        post :create, rt_volunteer_amendment: invalid_attributes
        expect(assigns(:rt_volunteer_amendment)).to be_a_new(Rt::VolunteerAmendment)
      end

      it 're-renders the "new" template' do
        post :create, rt_volunteer_amendment: invalid_attributes
        expect(response).to render_template('new')
      end
    end
  end
end
