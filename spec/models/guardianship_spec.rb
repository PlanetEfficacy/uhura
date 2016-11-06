require 'rails_helper'

RSpec.describe Guardianship, type: :model do
  it { should belong_to(:student) }
  it { should belong_to(:guardian) }
end
