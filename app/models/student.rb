class Student < ApplicationRecord
  has_many :enrollments
  has_many :groups, through: :enrollments
  has_many :users, through: :groups
  has_many :contacts, as: :contactable, dependent: :destroy

  alias_attribute :teachers, :users

  def phone_number
    contacts.find_by(default: true).phone_number
  end
end
