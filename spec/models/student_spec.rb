require 'rails_helper'

RSpec.describe Student, type: :model do
   it { should have_many(:enrollments) }
   it { should have_many(:groups) }
   it { should have_many(:users) }
   it { should have_many(:contacts) }
   it { should have_many(:messages) }

   it "has many users as teachers" do
     student = FactoryGirl.create(:student)
     expect(student.users).to eq(student.teachers)
   end

   it "has a primary contact" do
     student = FactoryGirl.create(:student)
     contact = FactoryGirl.create(:contact, contactable: student)

     expect(student.primary_contact).to eq(contact)
   end

   it "has a phone number" do
     student = FactoryGirl.create(:student)
     contact = FactoryGirl.create(:contact, contactable: student)

     expect(student.phone_number).to eq(contact.phone_number)
   end

   it "has a language" do
     student = FactoryGirl.create(:student, language_code: "es")

     expect(student.language).to eq("Spanish")
   end
end
