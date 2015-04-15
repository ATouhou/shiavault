module ApplicationHelper
  def html_title(page = nil)
    ['Shiavault', page].compact.join(' - ')
  end
end
