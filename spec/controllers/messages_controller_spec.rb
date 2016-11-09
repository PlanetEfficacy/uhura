require 'rails_helper'

RSpec.describe MessagesController, type: :controller do
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
end
