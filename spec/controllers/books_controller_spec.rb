require 'rails_helper'

RSpec.describe BooksController, type: :controller do
  let(:root) { "https://#{Rails.application.secrets.bucket}.s3.amazonaws.com/ebooks/books" }

  it 'redirects to S3 for ebook downloads' do
    get :download, id: 'title-book', format: 'epub'
    expect(response).to redirect_to("#{root}/title-book.epub")
  end

  describe 'invalid requests' do
    it 'is seeking a nested path' do
      get :download, id: 'title-book/nested', format: 'epub'
      expect(response.status).to be(400)
    end

    it 'is seeking an alternative format' do
      get :download, id: 'title-book', format: 'fake'
      expect(response.status).to be(400)
    end
  end
end
