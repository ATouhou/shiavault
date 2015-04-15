require 'rails_helper'

describe EbookService do
  it '#public_url' do
    url = described_class.new.public_url('example-path')
    expect(url).to include('example-path',
                           Rails.application.secrets.bucket)
  end
end