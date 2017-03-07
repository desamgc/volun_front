require 'rails_helper'

RSpec.describe Rt::VolunteersDemandsController, type: :controller do
  before(:each) do
    sign_in create(:user)
  end

  let(:valid_attributes) {
    attributes_for :volunteers_demand
  }

  let(:invalid_attributes) {
    attributes_for :volunteers_demand, :invalid
  }

  describe "GET #index" do
    it 'assigns all rt_volunteers_demands as @rt_volunteers_demands' do
      volunteers_demand = Rt::VolunteersDemand.create! valid_attributes
      get :index
      expect(assigns(:rt_volunteers_demands)).to eq([volunteers_demand])
    end
  end

  describe "GET #show" do
    it 'assigns the requested rt_volunteers_demand as @rt_volunteers_demand' do
      volunteers_demand = Rt::VolunteersDemand.create! valid_attributes
      get :show, id: volunteers_demand.to_param
      expect(assigns(:rt_volunteers_demand)).to eq(volunteers_demand)
    end
  end

  describe "GET #new" do
    it 'assigns a new rt_volunteers_demand as @rt_volunteers_demand' do
      get :new
      expect(assigns(:rt_volunteers_demand)).to be_a_new(Rt::VolunteersDemand)
    end
  end

  describe "GET #edit" do
    it 'assigns the requested rt_volunteers_demand as @rt_volunteers_demand' do
      volunteers_demand = Rt::VolunteersDemand.create! valid_attributes
      get :edit, id: volunteers_demand.to_param
      expect(assigns(:rt_volunteers_demand)).to eq(volunteers_demand)
    end
  end

  describe "POST #create" do
    context 'with valid params' do
      it 'creates a new Rt::VolunteersDemand' do
        expect {
          post :create, rt_volunteers_demand: valid_attributes
        }.to change(Rt::VolunteersDemand, :count).by(1)
      end

      it 'assigns a newly created rt_volunteers_demand as @rt_volunteers_demand' do
        post :create, rt_volunteers_demand: valid_attributes
        expect(assigns(:rt_volunteers_demand)).to be_a(Rt::VolunteersDemand)
        expect(assigns(:rt_volunteers_demand)).to be_persisted
      end

      it 'redirects to the created rt_volunteers_demand' do
        post :create, rt_volunteers_demand: valid_attributes
        expect(response).to redirect_to(rt_volunteers_demands_url)
      end
    end

    context 'with invalid params' do
      it 'assigns a newly created but unsaved rt_volunteers_demand as @rt_volunteers_demand' do
        post :create, rt_volunteers_demand: invalid_attributes
        expect(assigns(:rt_volunteers_demand)).to be_a_new(Rt::VolunteersDemand)
      end

      it 're-renders the "new" template' do
        post :create, rt_volunteers_demand: invalid_attributes
        expect(response).to render_template('new')
      end
    end
  end

  describe "PUT #update" do
    context 'with valid params' do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it 'updates the requested rt_volunteers_demand' do
        volunteers_demand = Rt::VolunteersDemand.create! valid_attributes
        put :update, id: volunteers_demand.to_param, rt_volunteers_demand: new_attributes
        volunteers_demand.reload
        skip("Add assertions for updated state")
      end

      it 'assigns the requested rt_volunteers_demand as @rt_volunteers_demand' do
        volunteers_demand = Rt::VolunteersDemand.create! valid_attributes
        put :update, id: volunteers_demand.to_param, rt_volunteers_demand: valid_attributes
        expect(assigns(:rt_volunteers_demand)).to eq(volunteers_demand)
      end

      it 'redirects to rt_volunteers_demands' do
        volunteers_demand = Rt::VolunteersDemand.create! valid_attributes
        put :update, id: volunteers_demand.to_param, rt_volunteers_demand: valid_attributes
        expect(response).to redirect_to(rt_volunteers_demands_url)
      end
    end

    context 'with invalid params' do
      it 'assigns the rt_volunteers_demand as @rt_volunteers_demand' do
        volunteers_demand = Rt::VolunteersDemand.create! valid_attributes
        put :update, id: volunteers_demand.to_param, rt_volunteers_demand: invalid_attributes
        expect(assigns(:rt_volunteers_demand)).to eq(volunteers_demand)
      end

      it 're-renders the "edit" template' do
        volunteers_demand = Rt::VolunteersDemand.create! valid_attributes
        put :update, id: volunteers_demand.to_param, rt_volunteers_demand: invalid_attributes
        expect(response).to render_template('edit')
      end
    end
  end

  describe "DELETE #destroy" do
    it 'destroys the requested rt_volunteers_demand' do
      volunteers_demand = Rt::VolunteersDemand.create! valid_attributes
      expect {
        delete :destroy, id: volunteers_demand.to_param
      }.to change(Rt::VolunteersDemand, :count).by(volunteers_demand.respond_to?(:archived?) ? 0 : -1)
    end

    it 'redirects to the rt_volunteers_demands list' do
      volunteers_demand = Rt::VolunteersDemand.create! valid_attributes
      delete :destroy, id: volunteers_demand.to_param
      expect(response).to redirect_to(rt_volunteers_demands_url)
    end
  end

end
