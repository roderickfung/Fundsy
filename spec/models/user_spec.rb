require 'rails_helper'

RSpec.describe User, type: :model do
  describe "#validations" do
    it "requires an email" do
      attributes = FactoryGirl.attributes_for(:user)
      attributes[:email] = nil
      user = User.new attributes
      user.valid?
      expect(user.errors).to have_key(:email)
    end

    it "requires a unique email" do
      user1 = FactoryGirl.create(:user)
      attributes = FactoryGirl.attributes_for(:user)
      attributes[:email] = user1.email
      user2 = User.new attributes
      user2.valid?
      expect(user2.errors).to have_key(:email)
    end

    it "requires a first name" do
      user = User.new FactoryGirl.attributes_for(:user).merge({first_name: nil})
      user.valid?
      expect(user.errors).to have_key(:first_name)
    end

    it "requires a last name" do
      user = User.new FactoryGirl.attributes_for(:user).merge({last_name: nil})
      # attributes = FactoryGirl.attributes_for(:user)
      # attributes[:last_name] = nil
      # user = User.new attributes
      user.valid?
      expect(user.errors).to have_key(:last_name)
    end

  end
end
