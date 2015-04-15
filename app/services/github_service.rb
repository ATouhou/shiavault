require 'open-uri'

class GithubService
  attr_reader :account, :repo, :branch

  def initialize(account: 'shiavault',
                 repo: 'shiavault-library',
                 branch: 'master')
    @account = account
    @repo = repo
    @branch = branch
  end

  def get(file)
    url = "https://raw.githubusercontent.com/#{account}/#{repo}/#{branch}/#{file}"
    open(url).read
  end

end