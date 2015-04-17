require 'rails_helper'
require 'jobs/sitemap_job'

describe SitemapJob do
  subject { described_class.new }
  let(:sitemap_path) { "#{Rails.root}/tmp/sitemap.xml" }
  let(:book) { build(:book) }

  before do
    File.delete(sitemap_path) if File.exists?(sitemap_path)
  end

  it 'generates sitemap.xml' do
    subject.perform(adapter: SitemapGenerator::FileAdapter.new, verbose: false, compress: false)

    with_xml(sitemap_path) do |doc|
      content = doc.css('url loc').first.content
      expect(content).to eq('http://www.shiavault.com')
    end
  end

  it 'must list all activities' do
    allow_any_instance_of(BookSearch).to receive(:all).and_return([book])

    subject.perform(adapter: SitemapGenerator::FileAdapter.new, verbose: false, compress: false)

    with_xml(sitemap_path) do |doc|
      content = doc.css('url loc').last.content
      expect(content).to eq("http://www.shiavault.com/books/#{book.to_param}")
    end
  end

  def with_xml(path)
    file = File.open(path)
    doc = Nokogiri::XML(file)
    yield doc
    file.close
  end
end