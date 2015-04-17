require 'open-uri'

class SeoController < ApplicationController

  #
  # Workaround for the Google Webmaster that does not recognize Amazon S3
  # as a sitemap destination by default. Thus, we simply "proxy" the S3 stored on
  # AWS out as the site's own sitemap.
  #
  def sitemap
    response = open('https://s3.amazonaws.com/dinesh-library/sitemap.xml')
    headers['Content-Type'] = 'application/xml'
    render text: response.read
  end

end