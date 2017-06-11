require "spec_helper"

RSpec.describe TinderAuthFetcher do
  it "has a version number" do
    expect(TinderAuthFetcher::VERSION).not_to be nil
  end

  describe '#self.fetch_token' do
    it 'should raise FacebookAuthenticationError if wrong email or password given' do
      expect { TinderAuthFetcher.fetch_token('wrong email', 'wrong_password') }.to raise_error(TinderAuthFetcher::FacebookAuthenticationError, 'Facebook Authentication failed. Check if you passed correct email and password')
    end

    # You have to set environment variables TINDER_AUTH_EMAIL, TINDER_AUTH_PASSWORD with your valid Facebook email address and password
    #
    # ex:
    #
    # ~/.bashrc
    # export TINDER_AUTH_EMAIL="you_facebook_email@gmail.com"
    # export TINDER_AUTH_PASSWORD="you_facebook_password"

    it 'should fetch a correct token' do
      email = ENV['TINDER_AUTH_EMAIL'] || raise('You have to set an environment variable with TINDER_AUTH_EMAIL before execute this test')
      password = ENV['TINDER_AUTH_PASSWORD'] || raise('You have to set an environment variable with TINDER_AUTH_PASSWORD before execute this test')

      expect(TinderAuthFetcher.fetch_token(email, password).length).not_to eq(0)
    end
  end
end
