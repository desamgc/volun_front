require 'rails_helper'

<% module_namespacing do -%>
RSpec.describe <%= controller_class_name %>Controller, <%= type_metatag(:controller) %> do
  
  before(:each) do
    sign_in create(:user)
  end
  
  let(:valid_attributes) {
    attributes_for :<%= file_name %>
  }

  let(:invalid_attributes) {
    attributes_for :<%= file_name %>, :invalid
  }

<% unless options[:singleton] -%>
  describe "GET #index" do
    it 'assigns all <%= table_name.pluralize %> as @<%= table_name.pluralize %>' do
      <%= file_name %> = <%= class_name %>.create! valid_attributes
      get :index
      expect(assigns(:<%= table_name %>)).to eq([<%= file_name %>])
    end
  end

<% end -%>
  describe "GET #show" do
    it 'assigns the requested <%= ns_file_name %> as @<%= ns_file_name %>' do
      <%= file_name %> = <%= class_name %>.create! valid_attributes
      get :show, id: <%= file_name %>.to_param
      expect(assigns(:<%= ns_file_name %>)).to eq(<%= file_name %>)
    end
  end

  describe "GET #new" do
    it 'assigns a new <%= ns_file_name %> as @<%= ns_file_name %>' do
      get :new
      expect(assigns(:<%= ns_file_name %>)).to be_a_new(<%= class_name %>)
    end
  end

  describe "GET #edit" do
    it 'assigns the requested <%= ns_file_name %> as @<%= ns_file_name %>' do
      <%= file_name %> = <%= class_name %>.create! valid_attributes
      get :edit, id: <%= file_name %>.to_param
      expect(assigns(:<%= ns_file_name %>)).to eq(<%= file_name %>)
    end
  end

  describe "POST #create" do
    context 'with valid params' do
      it 'creates a new <%= class_name %>' do
        expect {
          post :create, <%= ns_file_name %>: valid_attributes
        }.to change(<%= class_name %>, :count).by(1)
      end

      it 'assigns a newly created <%= ns_file_name %> as @<%= ns_file_name %>' do
        post :create, <%= ns_file_name %>: valid_attributes
        expect(assigns(:<%= ns_file_name %>)).to be_a(<%= class_name %>)
        expect(assigns(:<%= ns_file_name %>)).to be_persisted
      end

      it 'redirects to the created <%= ns_file_name %>' do
        post :create, <%= ns_file_name %>: valid_attributes
        expect(response).to redirect_to(<%= index_helper %>_url)
      end
    end

    context 'with invalid params' do
      it 'assigns a newly created but unsaved <%= ns_file_name %> as @<%= ns_file_name %>' do
        post :create, <%= ns_file_name %>: invalid_attributes
        expect(assigns(:<%= ns_file_name %>)).to be_a_new(<%= class_name %>)
      end

      it 're-renders the "new" template' do
        post :create, <%= ns_file_name %>: invalid_attributes
        expect(response).to render_template('new')
      end
    end
  end

  describe "PUT #update" do
    context 'with valid params' do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it 'updates the requested <%= ns_file_name %>' do
        <%= file_name %> = <%= class_name %>.create! valid_attributes
        put :update, id: <%= file_name %>.to_param, <%= ns_file_name %>: new_attributes
        <%= file_name %>.reload
        skip("Add assertions for updated state")
      end

      it 'assigns the requested <%= ns_file_name %> as @<%= ns_file_name %>' do
        <%= file_name %> = <%= class_name %>.create! valid_attributes
        put :update, id: <%= file_name %>.to_param, <%= ns_file_name %>: valid_attributes
        expect(assigns(:<%= ns_file_name %>)).to eq(<%= file_name %>)
      end

      it 'redirects to <%= table_name %>' do
        <%= file_name %> = <%= class_name %>.create! valid_attributes
        put :update, id: <%= file_name %>.to_param, <%= ns_file_name %>: valid_attributes
        expect(response).to redirect_to(<%= index_helper %>_url)
      end
    end

    context 'with invalid params' do
      it 'assigns the <%= ns_file_name %> as @<%= ns_file_name %>' do
        <%= file_name %> = <%= class_name %>.create! valid_attributes
        put :update, id: <%= file_name %>.to_param, <%= ns_file_name %>: invalid_attributes
        expect(assigns(:<%= ns_file_name %>)).to eq(<%= file_name %>)
      end

      it 're-renders the "edit" template' do
        <%= file_name %> = <%= class_name %>.create! valid_attributes
        put :update, id: <%= file_name %>.to_param, <%= ns_file_name %>: invalid_attributes
        expect(response).to render_template('edit')
      end
    end
  end

  describe "DELETE #destroy" do
    it 'destroys the requested <%= ns_file_name %>' do
      <%= file_name %> = <%= class_name %>.create! valid_attributes
      expect {
        delete :destroy, id: <%= file_name %>.to_param
      }.to change(<%= class_name %>, :count).by(<%= file_name %>.respond_to?(:archived?) ? 0 : -1)
    end

    it 'redirects to the <%= table_name %> list' do
      <%= file_name %> = <%= class_name %>.create! valid_attributes
      delete :destroy, id: <%= file_name %>.to_param
      expect(response).to redirect_to(<%= index_helper %>_url)
    end
  end

end
<% end -%>
