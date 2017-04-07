require 'rails_helper'

RSpec.describe Rt::OthersController, type: :controller do
  before(:each) do
    sign_in create(:user)
  end

  let(:valid_attributes) {
    attributes_for :other
  }

  let(:invalid_attributes) {
    attributes_for :other, :invalid
  }

 
  describe "GET #new" do
    it 'assigns a new rt_other as @rt_other' do
      get :new
      expect(assigns(:rt_other)).to be_a_new(Rt::Other)
    end
  end

  describe "POST #create" do
    context 'with valid params' do
      it 'creates a new Rt::Other' do
        expect {
          post :create, rt_other: valid_attributes
        }.to change(Rt::Other, :count).by(1)
      end

      it 'assigns a newly created rt_other as @rt_other' do
        post :create, rt_other: valid_attributes
        expect(assigns(:rt_other)).to be_a(Rt::Other)
        expect(assigns(:rt_other)).to be_persisted
      end

      it 'redirects to the created rt_other' do
        post :create, rt_other: valid_attributes
        expect(response).to redirect_to index_i_projects_path
      end
    end

    context 'with invalid params' do
      it 'assigns a newly created but unsaved rt_other as @rt_other' do
        post :create, rt_other: invalid_attributes
        expect(assigns(:rt_other)).to be_a_new(Rt::Other)
      end

      it 're-renders the "new" template' do
        post :create, rt_other: invalid_attributes
        expect(response).to render_template('new')
      end
    end
  end
end
