require 'rails_helper'

RSpec.describe GuardiansController, type: :controller do
  let(:guardian) { FactoryGirl.create(:guardian)}

  describe "anonymous GET new" do
    it "redirects to home page" do
      get :new
      expect(response).to redirect_to(root_path)
    end
  end

  describe "anonymous POST create" do
    it "redirects to home page" do
      post :create
      expect(response).to redirect_to(root_path)
    end
  end

  describe "anonymous POST create" do
    it "redirects to home page" do
      get :show, id: guardian.id
      expect(response).to redirect_to(root_path)
    end
  end

  describe "anonymous POST create" do
    it "redirects to home page" do
      get :edit, id: guardian.id
      expect(response).to redirect_to(root_path)
    end
  end

  describe "anonymous POST create" do
    it "redirects to home page" do
      put :update, id: guardian.id
      expect(response).to redirect_to(root_path)
    end
  end

  describe "anonymous POST create" do
    it "redirects to home page" do
      patch :update, id: guardian.id
      expect(response).to redirect_to(root_path)
    end
  end
  describe "anonymous POST create" do
    it "redirects to home page" do
      delete :destroy, id: guardian.id
      expect(response).to redirect_to(root_path)
    end
  end
end
