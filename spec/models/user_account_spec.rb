require 'rails_helper'
require 'spec_helper'

RSpec.describe UserAccount, type: :model do
  describe "check attributes and methods" do
    it "should be able to create a UserAccount object which has correct methods" do
      ua = UserAccount.create!(password: "testpass", email: "testuser@tests.com", accounttype: "Parent", name: "Tester Name", childname: "Test Child", childgrade: 5, homeaddress: "123 Test Street", admin: false)
      expect(ua).to respond_to :email
      expect(ua).to respond_to :accounttype
      expect(ua).to respond_to :name
      expect(ua).to respond_to :childname
      expect(ua).to respond_to :childgrade
      expect(ua).to respond_to :homeaddress
      expect(ua).to respond_to :validates_format_of
      expect(ua).to respond_to :admin
    end

  end

  before(:each) do
    @attribute = {
      :name => "Example User",
      :email => "user@example.com",
      :password => "changeme",
      :password_confirmation => "changeme"
    }
  end

  it "should create a new instance given a valid attribute" do
    UserAccount.create!(@attribute)
  end

  it "should require an email address" do
    empty_email_user = UserAccount.new(@attribute.merge(:email => ""))
    expect(empty_email_user).not_to be_valid
  end

  it "should accept valid email addresses" do
    emails = %w[user@foo.com THE_USER@foo.bar.org first.last@foo.jp]
    emails.each do |email|
      valid_email_user = UserAccount.new(@attribute.merge(:email => email))
      expect(valid_email_user).to be_valid
    end
  end

  it "should reject invalid email addresses" do
    addresses = ["userfoo,com","user_at_foo.org","example.user@foo."]
    addresses.each do |address|
      user =UserAccount.new(@attribute.merge(:email => address))
      expect(user.valid?).to eq(false)
    end
  end

  it "should reject duplicate email addresses" do
    UserAccount.create!(@attribute)
    user_with_duplicate_email = UserAccount.new(@attribute)
    expect(user_with_duplicate_email).not_to be_valid
  end

  it "should reject email addresses identical up to case" do
    upcased_email = @attribute[:email].upcase
    UserAccount.create!(@attribute.merge(:email => upcased_email))
    user_with_duplicate_email = UserAccount.new(@attribute)
    expect(user_with_duplicate_email).not_to be_valid
  end

  describe "passwords" do

    before(:each) do
      @user = UserAccount.new(@attribute)
    end

    it "should have a password attribute" do
      expect(@user).to respond_to(:password)
    end

    it "should have a password confirmation attribute" do
      expect(@user).to respond_to(:password_confirmation)

    end
  end

  describe "password validations" do

    it "should require a password" do
      user = UserAccount.new(@attribute.merge(:password => "", :password_confirmation => ""))
      expect(user).not_to be_valid
    end

    it "should require a matching password confirmation" do
      user = UserAccount.new(@attribute.merge(:password_confirmation => "invalid"))
      expect(user).not_to be_valid
    end

    it "should reject short passwords" do
      short_pass = "a" * 5
      short_pass_user = @attribute.merge(:password => short_pass, :password_confirmation => short_pass)
      user = UserAccount.new(short_pass_user)
      expect(user).not_to be_valid
    end

  end

  describe "password encryption" do

    before(:each) do
      @user = UserAccount.create!(@attribute)
    end

    it "should have an encrypted password attribute" do
      expect(@user).to respond_to(:encrypted_password)
    end

    it "should set the encrypted password attribute" do
      expect(@user.encrypted_password).not_to be_blank
    end

  end

  describe "has many association" do

    before(:each) do
      @user = UserAccount.create!(@attribute)
    end

    it "should have many requests" do
      ua = UserAccount.reflect_on_association(:requests)
      expect(ua.macro).to eq(:has_many)
    end

    it "should be have multiple requests" do
     @user.requests << Request.create(funding: true, projectname: "Bake Sale", accounttype: "Teacher", description: "Cupcakes, cookies, brownies, and more!", datesubmit: "5/1/18", datemailed: "4", price: 12.34, attachments: "request.txt")
     expect(@user.requests.length).to eq(1)
     @user.requests << Request.create(funding: true, projectname: "Car Wash", accounttype: "Parent", description: "Student run car wash", datesubmit: "4/23/18", datemailed: "4/26/18", price: 12.34, attachments: "request.txt")
     expect(@user.requests.length).to eq(2)

    end

  end


end
