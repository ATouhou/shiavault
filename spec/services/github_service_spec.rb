require 'rails_helper'

describe GithubService do
  let(:account) { 'shiavault' }
  let(:repo) { 'shiavault-library' }
  let(:service) { described_class.new(account: account, repo: repo) }

  it 'GETs file from master' do
    expect(service.get('.gitignore')).to_not be_empty
  end
end