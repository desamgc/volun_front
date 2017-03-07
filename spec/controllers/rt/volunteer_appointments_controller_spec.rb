require 'rails_helper'

RSpec.describe Rt::VolunteerAppointmentsController, type: :controller do
  before(:each) do
    sign_in create(:user)
  end

  let(:valid_attributes) {
    attributes_for :volunteer_appointment
  }

  let(:invalid_attributes) {
    attributes_for :volunteer_appointment, :invalid
  }

  describe "GET #index" do
    it 'assigns all rt_volunteer_appointments as @rt_volunteer_appointments' do
      volunteer_appointment = Rt::VolunteerAppointment.create! valid_attributes
      get :index
      expect(assigns(:rt_volunteer_appointments)).to eq([volunteer_appointment])
    end
  end

  describe "GET #show" do
    it 'assigns the requested rt_volunteer_appointment as @rt_volunteer_appointment' do
      volunteer_appointment = Rt::VolunteerAppointment.create! valid_attributes
      get :show, id: volunteer_appointment.to_param
      expect(assigns(:rt_volunteer_appointment)).to eq(volunteer_appointment)
    end
  end

  describe "GET #new" do
    it 'assigns a new rt_volunteer_appointment as @rt_volunteer_appointment' do
      get :new
      expect(assigns(:rt_volunteer_appointment)).to be_a_new(Rt::VolunteerAppointment)
    end
  end

  describe "GET #edit" do
    it 'assigns the requested rt_volunteer_appointment as @rt_volunteer_appointment' do
      volunteer_appointment = Rt::VolunteerAppointment.create! valid_attributes
      get :edit, id: volunteer_appointment.to_param
      expect(assigns(:rt_volunteer_appointment)).to eq(volunteer_appointment)
    end
  end

  describe "POST #create" do
    context 'with valid params' do
      it 'creates a new Rt::VolunteerAppointment' do
        expect {
          post :create, rt_volunteer_appointment: valid_attributes
        }.to change(Rt::VolunteerAppointment, :count).by(1)
      end

      it 'assigns a newly created rt_volunteer_appointment as @rt_volunteer_appointment' do
        post :create, rt_volunteer_appointment: valid_attributes
        expect(assigns(:rt_volunteer_appointment)).to be_a(Rt::VolunteerAppointment)
        expect(assigns(:rt_volunteer_appointment)).to be_persisted
      end

      it 'redirects to the created rt_volunteer_appointment' do
        post :create, rt_volunteer_appointment: valid_attributes
        expect(response).to redirect_to(rt_volunteer_appointments_url)
      end
    end

    context 'with invalid params' do
      it 'assigns a newly created but unsaved rt_volunteer_appointment as @rt_volunteer_appointment' do
        post :create, rt_volunteer_appointment: invalid_attributes
        expect(assigns(:rt_volunteer_appointment)).to be_a_new(Rt::VolunteerAppointment)
      end

      it 're-renders the "new" template' do
        post :create, rt_volunteer_appointment: invalid_attributes
        expect(response).to render_template('new')
      end
    end
  end

  describe "PUT #update" do
    context 'with valid params' do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it 'updates the requested rt_volunteer_appointment' do
        volunteer_appointment = Rt::VolunteerAppointment.create! valid_attributes
        put :update, id: volunteer_appointment.to_param, rt_volunteer_appointment: new_attributes
        volunteer_appointment.reload
        skip("Add assertions for updated state")
      end

      it 'assigns the requested rt_volunteer_appointment as @rt_volunteer_appointment' do
        volunteer_appointment = Rt::VolunteerAppointment.create! valid_attributes
        put :update, id: volunteer_appointment.to_param, rt_volunteer_appointment: valid_attributes
        expect(assigns(:rt_volunteer_appointment)).to eq(volunteer_appointment)
      end

      it 'redirects to rt_volunteer_appointments' do
        volunteer_appointment = Rt::VolunteerAppointment.create! valid_attributes
        put :update, id: volunteer_appointment.to_param, rt_volunteer_appointment: valid_attributes
        expect(response).to redirect_to(rt_volunteer_appointments_url)
      end
    end

    context 'with invalid params' do
      it 'assigns the rt_volunteer_appointment as @rt_volunteer_appointment' do
        volunteer_appointment = Rt::VolunteerAppointment.create! valid_attributes
        put :update, id: volunteer_appointment.to_param, rt_volunteer_appointment: invalid_attributes
        expect(assigns(:rt_volunteer_appointment)).to eq(volunteer_appointment)
      end

      it 're-renders the "edit" template' do
        volunteer_appointment = Rt::VolunteerAppointment.create! valid_attributes
        put :update, id: volunteer_appointment.to_param, rt_volunteer_appointment: invalid_attributes
        expect(response).to render_template('edit')
      end
    end
  end

  describe "DELETE #destroy" do
    it 'destroys the requested rt_volunteer_appointment' do
      volunteer_appointment = Rt::VolunteerAppointment.create! valid_attributes
      expect {
        delete :destroy, id: volunteer_appointment.to_param
      }.to change(Rt::VolunteerAppointment, :count).by(volunteer_appointment.respond_to?(:archived?) ? 0 : -1)
    end

    it 'redirects to the rt_volunteer_appointments list' do
      volunteer_appointment = Rt::VolunteerAppointment.create! valid_attributes
      delete :destroy, id: volunteer_appointment.to_param
      expect(response).to redirect_to(rt_volunteer_appointments_url)
    end
  end

end
