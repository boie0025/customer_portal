require 'spec_helper'

describe CustomerPortal::User do
  describe 'validations' do

    before(:each) do
      @user = CustomerPortal::User.new(
          username: 'test',
          password: 'password'
      )
    end

    context 'new user' do
      it 'requires password to be present for a new record' do
        expect(@user).to_not be_valid
      end

      it 'requires password to match validation' do
        @user.password_confirmation = 'not_password'
        expect(@user).to_not be_valid
      end
    end

    context 'existing user' do
      before(:each) do
        @user.password_confirmation = 'password'
        @user.save
        @user = subject.class.first
      end
      it 'does not require a password to be set' do
        @user.username = 'updated username'
        expect(@user).to be_valid
      end

      it 'requires password to match confirmation' do
        @user.password = 'blar'
        @user.password_confirmation = 'ralb'
        expect(@user).to_not be_valid
      end
    end

  end

  describe 'callbacks' do
    before(:each) do
      @user = CustomerPortal::User.new(
          username: 'test',
          password: 'password',
          password_confirmation: 'password'
      )
    end

    it 'creates a salt' do
      @user.save
      expect(@user.salt).to_not be_nil
    end

    it 'creates a hashed password' do
      @user.save
      expect(@user.hashed_password).to_not be_nil
    end

  end

end