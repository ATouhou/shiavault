require 'rails_helper'

feature 'ebooks' do
  let(:article) { 'The Truthful Stone' }
  let(:book) { 'Manner of Awaiting' }

  xscenario 'downloadable inside articles' do
    visit '/'
    click_link article

    expect(page).to have_css('.downloads a.epub')
    expect(page).to have_css('.downloads a.mobi')
  end

  scenario 'downloadable inside books' do
    visit '/'
    click_link book

    expect(page).to have_css('.downloads a.epub')
    expect(page).to have_css('.downloads a.mobi')
  end

end