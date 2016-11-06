require 'rails_helper'
RSpec.describe Guardian, type: :model do
  it { should belong_to(:relationship) }
  it { should have_many(:guardianships) }
  it { should have_many(:students) }
  it { should have_many(:contacts) }
  it { should have_many(:messages) }
  it { should define_enum_for(:status).with([:inactive, :active]) }
end
