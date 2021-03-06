module Dialogue
  def self.new_student_help
    "Students can be created individually or by bulk upload." + \
    " Once created, students can be added to one or more gro" + \
    "ups. To create a new student, complete the form below a" + \
    "nd click \"create\"."
  end

  def self.edit_student_help
    "To change the attributes of a student, use the form bel" + \
    "ow an click \"update\". To change the student's guardia" + \
    "ns or delete guardians from a student, use the controls" + \
    "on the student page."
  end

  def self.new_group_help
    "Groups of students are any set of students you want to " + \
    "message at one time. Teachers can have many groups and " + \
    "a single student can be a part of many classes. To crea" + \
    "te a new group, set the group name below and click \"cr" + \
    "eate\"."
  end

  def self.edit_group_help
    "To change the name of a group, use the form below an cl" + \
    "ick \"update\". To change the composition of a group, a" + \
    "dd or delete students from the group page."
  end

  def self.new_message_help
    "Messages are sent via sms to students, guardians, and o" + \
    "r groups. They are automatically translated into your t" + \
    "he default language of your selected recipient. To crea" + \
    "te a new message, type a message in the field below and" + \
    "click \"send\"."
  end

  def self.new_guardian_help
    "Guardians are people with relationships to a student. G" + \
    "uardians can be parents, grandparents, siblings, other " + \
    "relatives, healthcare providers, religious leaders, etc" + \
    ". Guardians can be linked to more than one student, as " + \
    "in the case of a parent with more than one child in a s" + \
    "chool. To create a new guardian, complete the form belo" + \
    "w and click \"send\". To link an already existing guard" + \
    " to a student, choose a guardian from the list and clic" + \
    "k\"send\"."
  end

  def self.edit_guardian_help
    "To change the attributes of a group, use the form below" + \
    "and click \"update\"."
  end

  def self.primary_contact_help
    "This guardian is a student's primary contact. A primary" + \
    " contact is the default number Uhura will send messages" + \
    " to when messaging a student's guardian."
  end

  def self.landing_page_left_content_block_header
    "Drive Achievement"
  end

  def self.landing_page_left_content_block_text
    "Communication between families and school is a key part" + \
    " of student success. Uhura is built by educators and ta" + \
    "kes into account the things that matter most."
  end

  def self.landing_page_center_content_block_header
    "Communicate Instantly"
  end

  def self.landing_page_center_content_block_text
    "SMS remains the most reliable means of communication fo" + \
    "r many families. Uhura makes it easy to text one studen" + \
    "t, family, class, and even groups of families."
  end

  def self.landing_page_right_content_block_header
    "Every Student"
  end

  def self.landing_page_right_content_block_text
    "The number of non-English speaking students and familie" + \
    "s is growing. Uhura uses advanced translation technolog" + \
    "y so communication can reach every student."
  end

  def self.landing_page_text
    "Uhura is making it easier than ever for educators, stud" + \
    "ents, and families to communicate across language barri" + \
    "ers about the things that matter most."
  end

  def self.bulk_upload_text
    "To upload many students and guardians at one time, crea" + \
    "te a csv file with the following headers: 'student firs" + \
    "t name', 'student last name', 'student language', 'stud" + \
    "ent phone number', 'guardian first name', 'guardian las" + \
    "t name', 'guardian language', and 'guardian phone numbe" + \
    "'. Each row will represent one student and their primar" + \
    "y guardian. Use the form below to upload the csv, selec" + \
    "t a group and click 'Upload'."
  end

  def self.how_to_make_groups
    "It looks like you do not have any groups set up. Let's " + \
    "fix that! Just click on the button below or close this " + \
    "pop up and click the yellow button in the bottom right " + \
    "corner of the screen."
  end

  def self.how_to_make_students
    "It looks like you do not have any students in this grou" + \
    "p. Let's fix that! Just click on the button below or cl" + \
    "ose this pop up and click the yellow button in the bott" + \
    "om right corner of the screen."
  end

  def self.how_to_make_guardians
    "It looks like you do not have any guardians attached to" + \
    "this student. Let's fix that! Just click on the button " + \
    "below or close this pop up and click the yellow button " + \
    "in the bottom right corner of the screen."
  end

  def self.existing_student_help
    "Students can be a part of multiple groups. To add a stu" + \
    "dent from another group into this group, select their n" + \
    "ame from the dropdown and click add."
  end

  def self.existing_guardian_help
    "Guardians can be the guardian of more than one student." + \
    " To add a guardian from another student to this student" + \
    ", select their name from the dropdown and click add."
  end
end
