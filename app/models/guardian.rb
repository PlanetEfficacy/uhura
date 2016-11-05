class Guardian < ApplicationRecord
  belongs_to :relationship
  has_many :guardianships, dependent: :destroy
  has_many :students, through: :guardianships
  has_many :contacts, as: :contactable, dependent: :destroy
  has_many :messages, through: :contacts

  include Contactable
end
