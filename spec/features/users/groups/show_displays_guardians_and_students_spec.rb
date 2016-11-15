require 'rails_helper'

RSpec.feature "user visits group show page" do
  scenario "sees students along side their primary guardians" do
    user = FactoryGirl.create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    group = FactoryGirl.create(:group, user: user)

    student = FactoryGirl.create(:student)
    FactoryGirl.create(:enrollment, group: group, student: student)

    primary_guardian = FactoryGirl.create(:guardian, primary: true)
    other_guardian = FactoryGirl.create(:guardian)

    FactoryGirl.create(:guardianship, guardian: primary_guardian, student: student)
    FactoryGirl.create(:guardianship, guardian: other_guardian, student: student)

    FactoryGirl.create(:contact, contactable: student)
    FactoryGirl.create(:contact, contactable: primary_guardian)

    visit group_path(group)

    expect(page).to have_content(student.name)
    expect(page).to have_content(student.phone_number)
    expect(page).to have_content(student.language)

    expect(page).to have_content(primary_guardian.name)
    expect(page).to have_content(primary_guardian.phone_number)
    expect(page).to have_content(primary_guardian.language)
  end
end
