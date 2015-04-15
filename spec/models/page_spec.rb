require 'rails_helper'

describe Page do
  let(:page) { build(:page) }

  it '#to_param' do
    expect(page.to_param).to eq(page.slug)
  end

  it 'lazy load body' do
    mock = double(get: 'mock body')
    expect(mock).to receive(:get).with(page.path)
    page.git_service = mock

    expect(page.body).to eq('mock body')
  end

end
