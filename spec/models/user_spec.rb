require 'rails_helper'

RSpec.describe User, type: :model do
  it "Is valid with all attributes" do
    @user = User.create(
      first_name: "John",
      last_name: "McLellan",
      email: "test@test.com",
      password: "password",
      password_confirmation: "password")
    expect(@user).to be_valid   
  end

  it "Is not valid without password" do
    @user = User.create(
      first_name: "John",
      last_name: "McLellan",
      email: "test@test.com",
      password: nil,
      password_confirmation: "password")
    expect(@user).not_to  be_valid   
  end

  it "Is not valid without name" do
    @user = User.create(
      first_name: nil,
      last_name: "McLellan",
      email: "test@test.com",
      password: "password",
      password_confirmation: "password")
    expect(@user).not_to  be_valid   
  end

  it "Is not valid without email" do
    @user = User.create(
      first_name: "John",
      last_name: "McLellan",
      email: nil,
      password: "password",
      password_confirmation: "password")
    expect(@user).not_to  be_valid   
  end


  it "Password length should be >= 5" do
    @user = User.create(
      first_name: "John",
      last_name: "McLellan",
      email: "test@test.com",
      password: "secure",
      password_confirmation: "secure")
    expect(@user.password.length).to be >= 5
  end

  it "Passwords won't match" do
    @user = User.create(
      first_name: "John",
      last_name: "McLellan",
      email: "test@test.com",
      password: "monster",
      password_confirmation: "mash")
    expect(@user.errors[:password_confirmation].first).to eq ("doesn't match Password")
  end

end



describe '.authenticate_with_credentials' do

it "Should authenticate even with spaces before/after email" do
    @user = User.create(
      first_name: "John",
      last_name: "McLellan",
      email: "this@gmail",
      password: "secure",
      password_confirmation: "secure")
    @login = User.authenticate_with_credentials("   this@gmail   ", "secure")  
    expect(@login).not_to be_nil
    
  end

  it "Should authenticate with capitals in email" do
    @user = User.create(
      first_name: "John",
      last_name: "McLellan",
      email: "this@gmail",
      password: "secure",
      password_confirmation: "secure")
    @login = User.authenticate_with_credentials("thIs@gMail", "secure")  
    expect(@login).not_to be_nil
    
  end

end
