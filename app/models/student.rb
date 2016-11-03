class Student < ApplicationRecord
  has_many :enrollments
  has_many :groups, through: :enrollments
  has_many :users, through: :groups
  has_many :contacts, as: :contactable

  alias_attribute :teachers, :users
end
