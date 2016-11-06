require 'rails_helper'

RSpec.feature "user navigates to root" do
  scenario "by clicking on the logo" do
    stub_omniauth
    student = FactoryGirl.create(:student)

    visit student_path(student)

    find(".brand-logo").click

    expect(current_path).to eq(groups_path)
  end
end
