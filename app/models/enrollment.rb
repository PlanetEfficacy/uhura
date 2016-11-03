class Enrollment < ApplicationRecord
  belongs_to :group
  belongs_to :student

  delegate :user, to: :group
  alias_attribute :teacher, :user
end
