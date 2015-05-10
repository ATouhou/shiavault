class BooksController < ApplicationController
  def show
    book = BookSearch.new.find(params[:id])
    @book = BookDecorator.new(book, view_context)
  end

  def download
    format = download_params[:format]
    return head 400 unless [:epub, :mobi].include?(format)

    slug = download_params[:slug]
    return head 400 if slug.include?('/')

    redirect_to EbookService.new.public_url("ebooks/books/#{slug}.#{format}")
  end

  private

  def download_params
    {
      format: params.require(:format).to_sym,
      slug: params.require(:id) # Temporary conversion
    }
  end
end
