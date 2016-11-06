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
    "te a new message, complete type a message in the field " + \
    "below and click \"send\"."
  end

  def self.new_guardian_help
    "Guardians are people with relationships to a student. G" + \
    "uardians can be parents, grandparents, siblings, other " + \
    "relatives, healthcare providers, religious leaders, etc" + \
    ". Guardians can be linked to more than one student, as " + \
    "in the case of a parent with more than one child in a s" + \
    "chool. To create a new guardian, complete the form belo" + \
    "w and click \"send\". To link an already existing guard" + \
    "to a student, choose a guardian from the list and click" + \
    "\"send\"."
  end

  def self.edit_guardian_help
    "To change the attributes of a group, use the form below" + \
    "and click \"update\"."
  end

  def self.primary_contact_help
    "This guardian is a student's primary contact. A primary" + \
    "contact is the default number Uhura will send messages " + \
    "to when messaging a student's guardian."
  end
end
