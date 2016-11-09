require 'rails_helper'

RSpec.describe GroupsController, type: :controller do
  describe "anonymous POST create" do
    it "redirects to home page" do
      post :create
      expect(response).to redirect_to(root_path)
    end
  end

  describe "anonymous DELETE destroy" do
    it "redirects to home page" do
      group = FactoryGirl.create(:group)
      delete :destroy, id: group.id
      expect(response).to redirect_to(root_path)
    end
  end
end
