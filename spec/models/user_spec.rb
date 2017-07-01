require 'rails_helper'

RSpec.describe User, type: :model do


#   # it { should have_many(:gyms) }
#   # it { should have_many(:reviews) }
  # keep up with these 2 tests here - come back after you create models for gyms and reviews

  it "is valid with valid attributes" do
    user = User.create(first_name: "John", last_name: "Mendes", email: "example@gmail.com", password: "mypassword", password_confirmation: "mypassword")
    expect(user).to be_valid
  end

  it "is not valid without a first_name" do
    user = User.create(last_name: "Mendes", email: "example@gmail.com", password: "mypassword", password_confirmation: "mypassword")
    expect(user).to_not be_valid
  end

  it "is not valid without a last_name" do
    user = User.create(first_name: "John", email: "example@gmail.com", password: "mypassword", password_confirmation: "mypassword")
    expect(user).to_not be_valid
  end

  it "is not valid without an email" do
    user = User.create(first_name: "John", last_name: "Mendes", password: "mypassword", password_confirmation: "mypassword")
    expect(user).to_not be_valid
  end

  it "is not valid without a password" do
    user = User.create(first_name: "John", last_name: "Mendes", email: "example@gmail.com")
    expect(user).to_not be_valid
  end
end

# email stays it wont let me re-run the tests
