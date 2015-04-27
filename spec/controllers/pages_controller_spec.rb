require 'rails_helper'

RSpec.describe PagesController, type: :controller do

  %w(about contribute).each do |page|
    it "has #{page} page" do
      get :show, id: page
      expect(response).to have_http_status(:success)
    end
  end

end
