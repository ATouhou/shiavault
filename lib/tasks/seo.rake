require 'sitemap_generator'
require 'jobs/sitemap_job'

namespace :seo do
  desc 'Sitemap update for SEO'
  task :sitemap => :environment do
    SitemapJob.new.perform(ping: true)
  end
end