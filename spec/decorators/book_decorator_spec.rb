require 'rails_helper'

describe BookDecorator do

  it '#html_description' do
    mock = double(description: '**Sample**')
    expect(described_class.new(mock).html_description).to eq("<p><strong>Sample</strong></p>\n")
  end
end