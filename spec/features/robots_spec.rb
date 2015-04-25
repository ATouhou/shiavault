require 'rails_helper'
require 'open-uri'

feature 'online book reading' do
  scenario 'static domains serve alternative robots.txt' do
    static_robots = open('http://static1.shiavault.com/robots.txt').read
    real_robots = File.read("#{Rails.root}/public/robots.txt")

    expect(static_robots).to_not eq(real_robots)
    expect(static_robots).to match(/^User-agent: \*/)
    expect(static_robots).to match(/^Disallow: \//)
  end
end