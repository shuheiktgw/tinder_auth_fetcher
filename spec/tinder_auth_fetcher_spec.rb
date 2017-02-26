require "spec_helper"

RSpec.describe TinderAuthFetcher do
  it "has a version number" do
    expect(TinderAuthFetcher::VERSION).not_to be nil
  end

  describe '#self.fetch_token' do
    it 'should raise Runtime Error if wrong email or password given' do
      expect { TinderAuthFetcher.fetch_token('wrong email', 'wrong_password') }.to raise_error(RuntimeError, 'Facebook login failed. Check if you passed correct email and password')
    end
  end
end
