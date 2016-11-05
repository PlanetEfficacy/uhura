require 'rails_helper'

RSpec.describe Relationship, type: :model do
  it { should have_many(:guardians) }
end
