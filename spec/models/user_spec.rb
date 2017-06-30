require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_many(:gyms) }
  it { should have_many(:reviews) }

  it "is valid with valid attributes"
  it "is not valid without a first_name"
  it "is not valid without a last_name"
  it "is not valid without a email"
  

end
