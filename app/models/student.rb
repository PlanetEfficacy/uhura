class Student < ApplicationRecord
  has_many :enrollments
  has_many :groups, through: :enrollments
  has_many :users, through: :groups
  has_many :contacts, as: :contactable, dependent: :destroy
  has_many :messages, through: :contacts

  alias_attribute :teachers, :users

  include FullName
  
  def phone_number
    primary_contact.phone_number
  end

  def language
    Languages.find(language_code)
  end

  def primary_contact
    contacts.find_by(default: true)
  end
end
