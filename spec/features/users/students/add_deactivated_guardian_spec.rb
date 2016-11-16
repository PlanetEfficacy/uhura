require 'rails_helper'

RSpec.feature "user adds a deactivated guardian to a student" do
  scenario "by selecting that guardian from a drop down" do
    user = FactoryGirl.create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    group_1 = FactoryGirl.create(:group, user: user)
    # group_2 = FactoryGirl.create(:group, user: user)

    student_1 = FactoryGirl.create(:student)
    # student_2 = FactoryGirl.create(:student)

    FactoryGirl.create(:enrollment, student: student_1, group: group_1)
    # FactoryGirl.create(:enrollment, student: student_2, group: group_2)

    guardian = FactoryGirl.create(:guardian, status: :inactive)
    FactoryGirl.create(:guardianship, student: student_1, guardian: guardian)

    contact = FactoryGirl.create(:contact, contactable: guardian)

    visit student_path(student_1)
    find("#add-existing-guardian").click

    find("#guardian-select").find("option[value='#{guardian.id}']").select_option
    click_on "Add"

    expect(current_path).to eq(student_path(student_1))
    within "li.collection-item" do
      expect(page).to have_content(guardian.name)
      expect(page).to have_content(guardian.phone_number)
      expect(page).to have_content(guardian.language)
    end
  end
end
