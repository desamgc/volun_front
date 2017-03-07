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

  describe "GET #index" do
    it 'assigns all rt_volunteer_amendments as @rt_volunteer_amendments' do
      volunteer_amendment = Rt::VolunteerAmendment.create! valid_attributes
      get :index
      expect(assigns(:rt_volunteer_amendments)).to eq([volunteer_amendment])
    end
  end

  describe "GET #show" do
    it 'assigns the requested rt_volunteer_amendment as @rt_volunteer_amendment' do
      volunteer_amendment = Rt::VolunteerAmendment.create! valid_attributes
      get :show, id: volunteer_amendment.to_param
      expect(assigns(:rt_volunteer_amendment)).to eq(volunteer_amendment)
    end
  end

  describe "GET #new" do
    it 'assigns a new rt_volunteer_amendment as @rt_volunteer_amendment' do
      get :new
      expect(assigns(:rt_volunteer_amendment)).to be_a_new(Rt::VolunteerAmendment)
    end
  end

  describe "GET #edit" do
    it 'assigns the requested rt_volunteer_amendment as @rt_volunteer_amendment' do
      volunteer_amendment = Rt::VolunteerAmendment.create! valid_attributes
      get :edit, id: volunteer_amendment.to_param
      expect(assigns(:rt_volunteer_amendment)).to eq(volunteer_amendment)
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
        expect(response).to redirect_to(rt_volunteer_amendments_url)
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

  describe "PUT #update" do
    context 'with valid params' do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it 'updates the requested rt_volunteer_amendment' do
        volunteer_amendment = Rt::VolunteerAmendment.create! valid_attributes
        put :update, id: volunteer_amendment.to_param, rt_volunteer_amendment: new_attributes
        volunteer_amendment.reload
        skip("Add assertions for updated state")
      end

      it 'assigns the requested rt_volunteer_amendment as @rt_volunteer_amendment' do
        volunteer_amendment = Rt::VolunteerAmendment.create! valid_attributes
        put :update, id: volunteer_amendment.to_param, rt_volunteer_amendment: valid_attributes
        expect(assigns(:rt_volunteer_amendment)).to eq(volunteer_amendment)
      end

      it 'redirects to rt_volunteer_amendments' do
        volunteer_amendment = Rt::VolunteerAmendment.create! valid_attributes
        put :update, id: volunteer_amendment.to_param, rt_volunteer_amendment: valid_attributes
        expect(response).to redirect_to(rt_volunteer_amendments_url)
      end
    end

    context 'with invalid params' do
      it 'assigns the rt_volunteer_amendment as @rt_volunteer_amendment' do
        volunteer_amendment = Rt::VolunteerAmendment.create! valid_attributes
        put :update, id: volunteer_amendment.to_param, rt_volunteer_amendment: invalid_attributes
        expect(assigns(:rt_volunteer_amendment)).to eq(volunteer_amendment)
      end

      it 're-renders the "edit" template' do
        volunteer_amendment = Rt::VolunteerAmendment.create! valid_attributes
        put :update, id: volunteer_amendment.to_param, rt_volunteer_amendment: invalid_attributes
        expect(response).to render_template('edit')
      end
    end
  end

  describe "DELETE #destroy" do
    it 'destroys the requested rt_volunteer_amendment' do
      volunteer_amendment = Rt::VolunteerAmendment.create! valid_attributes
      expect {
        delete :destroy, id: volunteer_amendment.to_param
      }.to change(Rt::VolunteerAmendment, :count).by(volunteer_amendment.respond_to?(:archived?) ? 0 : -1)
    end

    it 'redirects to the rt_volunteer_amendments list' do
      volunteer_amendment = Rt::VolunteerAmendment.create! valid_attributes
      delete :destroy, id: volunteer_amendment.to_param
      expect(response).to redirect_to(rt_volunteer_amendments_url)
    end
  end

end
