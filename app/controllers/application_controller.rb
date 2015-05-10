class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  protected

  def track_event(*args)
    return unless Rails.env.production?
    Gabba::Gabba.new('UA-61814862-1', 'shiavault.com').event(*args)
  end
end
