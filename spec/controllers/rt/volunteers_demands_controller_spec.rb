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

  describe "GET #new" do
    it 'assigns a new rt_volunteers_demand as @rt_volunteers_demand' do
      get :new
      expect(assigns(:rt_volunteers_demand)).to be_a_new(Rt::VolunteersDemand)
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
        expect(response).to redirect_to index_i_projects_path
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
end
