class Guardianship < ApplicationRecord
  belongs_to :student
  belongs_to :guardian
end
