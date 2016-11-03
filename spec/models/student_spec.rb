require 'rails_helper'

RSpec.describe Student, type: :model do
   it { should have_many(:enrollments) }
   it { should have_many(:groups) }
   it { should have_many(:users) }
   it { should have_many(:contacts) }

   it "has many users as teachers" do
     student = FactoryGirl.create(:student)
     expect(student.users).to eq(student.teachers)
   end
end
