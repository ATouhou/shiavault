require 'rails_helper'

describe BitbucketService do
  let(:account) { Rails.application.secrets.bitbucket_account }
  let(:repo) { 'dinesh' }
  let(:service) { described_class.new(account: account, repo: repo) }

  it 'GETs file from master' do
    expect(service.get('.ruby-version')).to eq('2.2.1')
  end
end