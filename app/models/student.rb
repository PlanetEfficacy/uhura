class Student < ApplicationRecord
  has_many :enrollments, dependent: :destroy
  has_many :groups, through: :enrollments
  has_many :users, through: :groups
  has_many :contacts, as: :contactable, dependent: :destroy
  has_many :messages, through: :contacts
  has_many :guardianships
  has_many :guardians, through: :guardianships

  alias_attribute :teachers, :users

  enum status: [:inactive, :active]

  scope :active, -> { where(status: :active) }

  include Contactable

  def primary_guardian
    guardians.active.find_by(primary: true)
  end

  # def self.primary_guardians
  #   binding.pry
  #   guardians.active.where(primary: true)
  # end
end
