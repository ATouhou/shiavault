class Page
  include ActiveModel::Model

  attr_accessor :uuid,
                :title,
                :slug,
                :path,
                :source,
                :git_service

  def to_param
    slug
  end

  def body
    git_service.get(path)
  end

  private

  def git_service
    @git_service ||= GIT_SERVICE.new
  end
end
