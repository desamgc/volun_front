require 'rails_helper'

RSpec.describe Rt::VolunteerAmendmentsController, type: :controller do
  let(:user) { create(:user, :user_volunteer) }
  before(:each) do
    sign_in user
  end

  let(:valid_attributes) {
    attributes_for :volunteer_amendment
  }

  let(:invalid_attributes) {
    attributes_for :volunteer_amendment, :invalid
  }


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
        expect(response).to redirect_to user_path(user)
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
