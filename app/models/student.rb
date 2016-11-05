class Student < ApplicationRecord
  has_many :enrollments
  has_many :groups, through: :enrollments
  has_many :users, through: :groups
  has_many :contacts, as: :contactable, dependent: :destroy
  has_many :messages, through: :contacts
  has_many :guardianships
  has_many :guardians, through: :guardianships

  alias_attribute :teachers, :users

  include Contactable
  
end
