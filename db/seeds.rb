class Seed
  def self.start
    seed = Seed.new
    # seed.generate_relationships
    # seed.generate_groups
    # seed.generate_students_and_guardians
    # seed.generate_contacts
  end


  def generate_groups
    puts "Creating groups...."
    FactoryGirl.create(:group, name: "History A", user: User.first)
    FactoryGirl.create(:group, name: "History B", user: User.first)
    FactoryGirl.create(:group, name: "History C", user: User.first)
    FactoryGirl.create(:group, name: "History D", user: User.first)
    FactoryGirl.create(:group, name: "Attendance Intervention", user: User.first)
    puts "#{Group.count} groups have been added to the database."
  end

  def generate_relationships
    puts "Creating relationships...."
    FactoryGirl.create(:relationship)
    FactoryGirl.create(:relationship, type: "Grandparent")
  end

  def generate_students_and_guardians
    puts "Creating students and guardians...."
    Group.all.each do |group|
      10.times do
        puts "Creating a new student"
        student = FactoryGirl.create(:student)
        puts "Creating a primary guradian"
        guardian_1 = FactoryGirl.create(:guardian, relationship: Relationship.first, primary: true)
        puts "Creating a second guradian"
        guardian_2 = FactoryGirl.create(:guardian, relationship: Relationship.last)
        FactoryGirl.create(:guardianship, student: student, guardian: guardian_1)
        FactoryGirl.create(:guardianship, student: student, guardian: guardian_2)
        FactoryGirl.create(:enrollment, student: student, group: group)
        puts "Student #{student.name} and guardians: #{guardian_1.name} and #{guardian_2.name} added to Group: #{group.name}"
      end
    end
  end

  def generate_contacts
    puts "Create contacts for students...."
    Student.all.each do |student|
      contact = FactoryGirl.create(:contact, contactable: student)
    end

    puts "Create contacts for parents...."
    Guardian.all.each do |guardian|
      contact = FactoryGirl.create(:contact, contactable: guardian)
    end
  end
end

Seed.start
