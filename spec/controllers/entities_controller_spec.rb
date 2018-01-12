require 'rails_helper'

RSpec.describe EntitiesController, type: :controller do

  let(:valid_attributes) {
    FactoryGirl.attributes_for(:entity).merge(address_attributes: FactoryGirl.attributes_for(:address)).merge( user_attributes: FactoryGirl.attributes_for(:user))
  }

  let(:invalid_attributes) {
    attributes_for(:entity, :invalid).merge(address_attributes: FactoryGirl.attributes_for(:address)).merge( user_attributes: FactoryGirl.attributes_for(:user))
  }
=begin
  before do
      @user = FactoryGirl.build(:user)
      @entity = FactoryGirl.build(:entity, :user => @user )
      entity_user = { "user_attributes" => @user.attributes.merge(password:"12345678", password_confirmation: "12345678")  }
      entity_address = { "address_attributes" => @entity.address.attributes  }
      @valid_attributes = @entity.attributes.merge(entity_address)
      @valid_attributes = @valid_attributes.merge(entity_user)

      @entity.contact_name =""
      @invalid_attributes = @entity.attributes.merge(entity_address)
      @invalid_attributes = @invalid_attributes.merge(entity_user)
  end
=end
  describe "POST #create" do
    context 'with valid params' do
      it 'creates a new Entity' do
        expect {
          post :create, entity: valid_attributes
        }.to change(Entity, :count).by(1)
      end
      it 'assigns a newly created entity as @entity' do
        post :create, entity: valid_attributes
        expect(assigns(:entity)).to be_a(Entity)
        expect(assigns(:entity)).to be_persisted
      end

      it 'redirects to the entities_path' do
        post :create, entity: valid_attributes
        expect(response).to redirect_to entities_path
      end
    end
    context 'with invalid params' do
      it 'falla assigns a newly created but unsaved entity as @entity' do
        post :create, entity: invalid_attributes
        expect(assigns(:entity)).to be_a_new(Entity)
      end

      it 're-renders the "new" template' do
        post :create, entity: invalid_attributes
        expect(response).to render_template('new')
      end
    end
  end

end
