require 'rails_helper'

describe ArticleDecorator do

  it '#html_body' do
    mock = double(body: '**Sample**')
    expect(described_class.new(mock).html_body).to eq("<p><strong>Sample</strong></p>\n")
  end
end