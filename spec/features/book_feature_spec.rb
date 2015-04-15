require 'rails_helper'

feature 'online book reading' do
  let(:book) { 'Manner of Awaiting' }
  let(:chapter) { 'Recognition of Imam of the Age' }

  before do
    visit '/'
    click_link book
  end

  scenario 'able to read book description' do
    description = find('.description').text
    expect(description).to start_with('"Manner of Awaiting" is a small collection')
  end

  scenario 'able to view all chapters' do
    chapters = find('.chapters').text
    expect(chapters).to include(chapter)
  end

  scenario 'able to navigate between chapters' do
    click_link chapter

    expect(page).to have_css('a.next')
    expect(page).to have_css('a.previous')

    click_link 'Next'
    expect(find('h1').text).to eq('Following the Imam of the Age')
  end
end