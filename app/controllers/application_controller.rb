class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  protected

  def track_event(category:, action:, label:, value: nil)
    # return unless Rails.env.production?

    options = {
      v: 1,
      tid: 'UA-61814862-1',
      cid: cookies[:_ga],
      t: 'event',
      ec: category,
      ea: action,
      el: label,
      ev: value
    }.compact

    RestClient.post('http://www.google-analytics.com/collect', options)
  end

end
