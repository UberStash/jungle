require 'rails_helper'

RSpec.describe User, type: :model do
  it "Is valid with all attributes" do
    @user = User.create(
      name: "John McLellan",
      email: "test@test.com",
      password: "password",
      password_confirmation: "password")
    expect(@user).to be_valid   
  end

  it "Is not valid without password" do
    @user = User.create(
      name: "John McLellan",
      email: "test@test.com",
      password: "password",
      password_confirmation: "Password")
    expect(@user).not_to  be_valid   
  end

  it "Is not valid without name" do
    @user = User.create(
      name: "",
      email: "test@test.com",
      password: nil,
      password_confirmation: "password")
    expect(@user).not_to  be_valid   
  end

  it "Is not valid without email" do
    @user = User.create(
      name: "Happy",
      email: nil,
      password: "password",
      password_confirmation: "Password")
    expect(@user).not_to  be_valid   
  end

  it "Is not valid without name" do
    @user = User.create(
      name: nil,
      email: "test@test.com",
      password: "password",
      password_confirmation: "Password")
    expect(@user).not_to  be_valid   
  end


end
