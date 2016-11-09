require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  describe "anonymous POST create" do
    it "redirects to home page" do
      get :destroy, use_route: :sessions
      expect(response).to redirect_to(root_path)
    end
  end
end
