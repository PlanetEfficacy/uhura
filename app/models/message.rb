class Message < ApplicationRecord
  belongs_to :user
  belongs_to :contact
  validates_presence_of :body
end
