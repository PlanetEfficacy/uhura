class Contact < ApplicationRecord
  belongs_to :contactable, polymorphic: true
  has_many :messages
end
