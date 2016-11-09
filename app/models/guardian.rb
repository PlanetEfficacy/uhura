class Guardian < ApplicationRecord
  has_many :guardianships
  has_many :students, through: :guardianships
  has_many :contacts, as: :contactable
  has_many :messages, through: :contacts
  belongs_to :relationship

  enum status: [:inactive, :active]

  scope :active, -> { where(status: :active) }
  # scope :not_inactive, -> { where.not(status: :inactive) }

  include Contactable

  def relationship
    relationship.type
  end

end
