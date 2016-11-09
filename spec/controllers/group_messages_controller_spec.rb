require 'rails_helper'

RSpec.describe GroupMessagesController, type: :controller do
  describe "anonymous GET new" do
    it "redirects to home page" do
      get :new, use_route: :group_messages
      expect(response).to redirect_to(root_path)
    end
  end

  describe "anonymous POST create" do
    it "redirects to home page" do
      post :create, use_route: :group_messages
      expect(response).to redirect_to(root_path)
    end
  end
end
