require 'spec_helper'

RSpec.describe TinderAuthFetcher do
  describe '#self.fetch_token' do
    it 'should fetch a correct token' do
      email = ENV['TINDER_AUTH_EMAIL'] || raise('You have to set an environment variable with TINDER_AUTH_EMAIL before execute this test')
      password = ENV['TINDER_AUTH_PASSWORD'] || raise('You have to set an environment variable with TINDER_AUTH_PASSWORD before execute this test')

      expect(TinderAuthFetcher.fetch_token(email, password).length).not_to eq(0)
    end
  end
end
