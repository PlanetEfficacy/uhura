require 'rails_helper'

RSpec.describe Message, type: :model do
  it { should belong_to(:user)}
  it { should belong_to(:contact)}
  it { should validate_presence_of(:body) }
end
