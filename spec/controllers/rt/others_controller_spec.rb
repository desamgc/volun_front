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

  describe "GET #index" do
    it 'assigns all rt_others as @rt_others' do
      other = Rt::Other.create! valid_attributes
      get :index
      expect(assigns(:rt_others)).to eq([other])
    end
  end

  describe "GET #show" do
    it 'assigns the requested rt_other as @rt_other' do
      other = Rt::Other.create! valid_attributes
      get :show, id: other.to_param
      expect(assigns(:rt_other)).to eq(other)
    end
  end

  describe "GET #new" do
    it 'assigns a new rt_other as @rt_other' do
      get :new
      expect(assigns(:rt_other)).to be_a_new(Rt::Other)
    end
  end

  describe "GET #edit" do
    it 'assigns the requested rt_other as @rt_other' do
      other = Rt::Other.create! valid_attributes
      get :edit, id: other.to_param
      expect(assigns(:rt_other)).to eq(other)
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
        expect(response).to redirect_to(rt_others_url)
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

  describe "PUT #update" do
    context 'with valid params' do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it 'updates the requested rt_other' do
        other = Rt::Other.create! valid_attributes
        put :update, id: other.to_param, rt_other: new_attributes
        other.reload
        skip("Add assertions for updated state")
      end

      it 'assigns the requested rt_other as @rt_other' do
        other = Rt::Other.create! valid_attributes
        put :update, id: other.to_param, rt_other: valid_attributes
        expect(assigns(:rt_other)).to eq(other)
      end

      it 'redirects to rt_others' do
        other = Rt::Other.create! valid_attributes
        put :update, id: other.to_param, rt_other: valid_attributes
        expect(response).to redirect_to(rt_others_url)
      end
    end

    context 'with invalid params' do
      it 'assigns the rt_other as @rt_other' do
        other = Rt::Other.create! valid_attributes
        put :update, id: other.to_param, rt_other: invalid_attributes
        expect(assigns(:rt_other)).to eq(other)
      end

      it 're-renders the "edit" template' do
        other = Rt::Other.create! valid_attributes
        put :update, id: other.to_param, rt_other: invalid_attributes
        expect(response).to render_template('edit')
      end
    end
  end

  describe "DELETE #destroy" do
    it 'destroys the requested rt_other' do
      other = Rt::Other.create! valid_attributes
      expect {
        delete :destroy, id: other.to_param
      }.to change(Rt::Other, :count).by(other.respond_to?(:archived?) ? 0 : -1)
    end

    it 'redirects to the rt_others list' do
      other = Rt::Other.create! valid_attributes
      delete :destroy, id: other.to_param
      expect(response).to redirect_to(rt_others_url)
    end
  end

end
