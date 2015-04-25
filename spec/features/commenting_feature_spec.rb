require 'rails_helper'

feature 'comments' do
  let(:book) { 'Manner of Awaiting' }
  let(:chapter) { 'Recognition of Imam of the Age' }

  before do
    visit '/'
    click_link book
  end

  scenario 'able to comment on book' do
    expect(page).to have_css('.comments')
  end

  scenario 'able to comment on chapter' do
    click_link chapter
    expect(page).to have_css('.comments')
  end
end
