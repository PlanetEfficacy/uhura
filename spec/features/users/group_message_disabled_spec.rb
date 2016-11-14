require 'rails_helper'

RSpec.feature "when a user with groups visits the groups page" do
  it "the group message button is disabled when there are no group members" do
    user = FactoryGirl.create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    group = FactoryGirl.create(:group, user: user)

    visit groups_path

    expect(page).to have_css(".btn-floating.btn-small.waves-effect.waves-light.indigo.darken-3.group-text-btn.disabled")
  end
end
