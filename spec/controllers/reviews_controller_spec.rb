require 'rails_helper'

RSpec.describe ReviewsController, :type => :controller do
  describe "GET index" do
    it "has a 200 status code" do
      # get :index
      response.code.should eq("200")
    end
  end

    
end
