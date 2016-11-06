class Guardian < ApplicationRecord
  belongs_to :relationship
  has_many :guardianships
  has_many :students, through: :guardianships
  has_many :contacts, as: :contactable
  has_many :messages, through: :contacts

  enum status: [:inactive, :active]

  scope :active, -> { where(status: :active) }
  # scope :not_inactive, -> { where.not(status: :inactive) }

  include Contactable

end
