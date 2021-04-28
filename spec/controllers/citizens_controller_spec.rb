require 'rails_helper'
RSpec.describe CitizensController, type: :controller do
  let(:user) { create(:user) }

  let!(:citizen) { create(:citizen) }

  let(:valid_attributes) { attributes_for(:citizen) }

  let(:invalid_attributes) do
    {cpf: '', address: '', email: 'a..@example.org'}
  end

  describe "GET #index" do

    it "returns a success response" do
      sign_in user
      get :index, params: {}
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      sign_in user
      get :show, params: {id: citizen.to_param}
      expect(response).to be_successful
    end
  end

  describe "GET #new" do
    it "returns a success response" do
      sign_in user
      get :new, params: {}
      expect(response).to be_successful
    end
  end

  describe "GET #edit" do
    it "returns a success response" do
      sign_in user
      get :edit, params: {id: citizen.to_param}
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "requires a logged-in user" do
        post :create, params: { citizen: valid_attributes }
        expect(response).to redirect_to(new_user_session_path)
      end

      it 'create a new citizen' do
        sign_in user
        expect{
          post :create, params: { citizen: valid_attributes }
        }.to change(Citizen, :count).by(1)
      end
    end

    context "with invalid params" do
      it "rende new template" do
        sign_in user
        expect {
          post :create, params: { citizen: invalid_attributes}
        }.not_to change(Citizen, :count)
        expect(response).to render_template('citizens/new')
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) do
        { telephone: 'new telephone'   }
      end
      it "updates the requested video" do
        sign_in user
        expect {
          put :update, params: { id: citizen.to_param, citizen: new_attributes }
          citizen.reload
        }.to change(citizen, :attributes)
      end
    end

    context "with invalid params" do
      let(:new_attributes) do
        { telephone: ''   }
      end
      it "rende edit template" do
        sign_in user
        expect {
          put :update, params: { id: citizen.to_param, citizen: new_attributes}
        }.not_to change(Citizen, :count)
        expect(response).to render_template('citizens/edit')
      end
    end
  end
end
