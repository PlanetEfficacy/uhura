require 'rails_helper'

RSpec.describe Student, type: :model do
   it { should have_many(:enrollments) }
   it { should have_many(:groups) }
   it { should have_many(:users) }
   it { should have_many(:contacts) }
   it { should have_many(:messages) }
   it { should have_many(:guardianships) }
   it { should have_many(:guardians) }
   it { should define_enum_for(:status).with([:inactive, :active]) }

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

   it "has a full name" do
      student = FactoryGirl.create(:student)

      expect(student.name).to eq("#{student.first_name} #{student.last_name}")
   end

   it "has a primary guardian" do
     student = FactoryGirl.create(:student)
     guardian = FactoryGirl.create(:guardian, primary: true)
     FactoryGirl.create(:guardianship, student: student, guardian: guardian)

     expect(student.primary_guardian).to eq(guardian)
   end

  #  it "has can find all primary guardians" do
  #    student = FactoryGirl.create(:student)
  #    student_2 = FactoryGirl.create(:student)
  #    guardian = FactoryGirl.create(:guardian, primary: true)
  #    guardian_2 = FactoryGirl.create(:guardian, primary: true)
  #    FactoryGirl.create(:guardianship, student: student, guardian: guardian)
  #    FactoryGirl.create(:guardianship, student: student_2, guardian: guardian_2)
   #
  #    expect(Student.primary_guardians).to eq([guardian, guardian_2])
  #  end

end
