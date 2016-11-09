require 'rails_helper'

RSpec.feature "user who visits student show page and has no guardians" do
  scenario "sees instructions for making guardians" do
    user = FactoryGirl.create(:user)
    group = FactoryGirl.create(:group)
    student = FactoryGirl.create(:student)
    FactoryGirl.create(:enrollment, group: group, student: student)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit student_path(student)

    within "div.modal.start-open" do
      expect(page).to have_content(Dialogue.how_to_make_guardians)
      expect(page).to have_link("Create your first guardian")
    end
  end
end
