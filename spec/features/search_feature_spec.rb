require 'rails_helper'

feature 'search' do
  before do
    visit '/'
  end

  scenario 'able to search by title', :js do
    fill_in 'search', with: 'Justice'

    all('.list__book:not(.hidden)').each do |node|
      expect(node.text).to match(/justice/i)
    end
  end

end
