require 'rails_helper'

RSpec.describe Group, type: :model do
  it { should belong_to(:user) }
  it { should have_many(:enrollments) }
  it { should have_many(:students) }
end
