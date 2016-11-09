require 'rails_helper'

RSpec.describe GroupGuardiansMessagesController, type: :controller do
  describe "anonymous GET new" do
    it "redirects to home page" do
      get :new, use_route: :group_guardians_messages
      expect(response).to redirect_to(root_path)
    end
  end

  describe "anonymous POST create" do
    it "redirects to home page" do
      post :create, use_route: :group_guardians_messages
      expect(response).to redirect_to(root_path)
    end
  end
end
