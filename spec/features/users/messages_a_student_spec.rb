require 'rails_helper'

RSpec.feature "user messages a student" do
  scenario "by completing the new message form" do
    user = FactoryGirl.create(:user)
    group = FactoryGirl.create(:group, user: user)
    student = FactoryGirl.create(:student)
    contact = FactoryGirl.create(:contact, contactable: student)
    enrollment = FactoryGirl.create(:enrollment, group: group, student: student)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit group_path(group)
    find(".btn-floating").click
    expect(current_path).to eq(new_message_path)

    fill_in "Message", with: "This is a test text message"

    click_on "Send"

    expect(current_path).to eq(student_path(student))
    expect(page).to have_content(student.first_name)
    expect(page).to have_content(student.last_name)
    expect(page).to have_content("Messages sent: 1")
  end
end
