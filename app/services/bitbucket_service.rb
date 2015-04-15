require 'oauth_util'
require 'open-uri'

class BitbucketService
  attr_reader :account, :repo, :branch

  def initialize(account: Rails.application.secrets.bitbucket_account,
                 repo: 'dinesh-library',
                 key: Rails.application.secrets.bitbucket_key,
                 secret: Rails.application.secrets.bitbucket_secret,
                 branch: 'master')
    @account = account
    @repo = repo
    @key = key
    @secret = secret
    @branch = branch
  end

  def get(file)
    uri = URI.parse("https://bitbucket.org/api/1.0/repositories/#{account}/#{repo}/raw/#{branch}/#{file}")
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true

    req = Net::HTTP::Get.new("#{ uri.path }?#{ oauth.sign(uri).query_string }")
    res = http.request(req)
    res.read_body
  end

  private

  def oauth
    oauth = OauthUtil.new
    oauth.consumer_key = @key
    oauth.consumer_secret = @secret
    oauth
  end
end