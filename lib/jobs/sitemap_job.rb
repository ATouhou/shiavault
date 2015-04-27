class SitemapJob
  include Shiavault::Application.routes.url_helpers

  def perform(ping: false, verbose: true, **options)
    SitemapGenerator::Sitemap.verbose = verbose
    SitemapGenerator::Sitemap.compress = options.fetch(:compress, false)
    SitemapGenerator::Sitemap.adapter = options.fetch(:adapter, s3_adapter)
    SitemapGenerator::Sitemap.public_path = 'tmp/'
    SitemapGenerator::Sitemap.default_host = I18n.t(:url)
    SitemapGenerator::Sitemap.create do
      %w(about contribute).each do |page|
        add page_path(page)
      end

      BookSearch.new.all.each do |book|
        add book_path(book)
      end
    end

    SitemapGenerator::Sitemap.ping_search_engines if ping
  end

  private

  def s3_adapter
    secrets = Rails.application.secrets
    SitemapGenerator::S3Adapter.new(
      aws_access_key_id: secrets.aws_access_key_id,
      aws_secret_access_key: secrets.aws_secret_access_key,
      fog_provider: 'AWS',
      fog_directory: secrets.bucket,
      fog_region: secrets.region
    )
  end
end