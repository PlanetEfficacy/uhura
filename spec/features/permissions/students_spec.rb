require 'rails_helper'

RSpec.feature "visitor cannot see private content:" do
  scenario "when they go to /students/:id, they are redirected to home page" do
    student = FactoryGirl.create(:student)
    visit student_path(student)
    expect(current_path).to eq(root_path)
  end

  scenario "when they go to /groups/new, they are redirected to home page" do
    visit new_student_path
    expect(current_path).to eq(root_path)
  end
end
