require 'rails_helper'

RSpec.describe Enrollment, type: :model do
  it { should belong_to(:group) }
  it { should belong_to(:student) }

  it "belongs to a teacher through a group" do
    user = FactoryGirl.create(:user)
    group = FactoryGirl.create(:group, user: user)
    enrollment = FactoryGirl.create(:enrollment, group: group)

    expect(enrollment.teacher).to eq(user)
  end
end
