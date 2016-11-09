require 'rails_helper'

RSpec.feature "user navigates to root" do
  scenario "by clicking on the logo" do
    user = FactoryGirl.create(:user)
    student = FactoryGirl.create(:student)
    
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit student_path(student)

    find(".brand-logo").click

    expect(current_path).to eq(groups_path)
  end
end
