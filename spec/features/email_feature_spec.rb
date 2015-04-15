require 'rails_helper'

feature 'email not displayed in plain-text' do
  scenario 'any page' do
    visit '/'
    expect(page).to_not have_content('info@shiavault.com')
  end
end