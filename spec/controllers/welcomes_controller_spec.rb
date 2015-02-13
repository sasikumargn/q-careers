require 'rails_helper'

RSpec.describe WelcomesController, type: :controller do
	describe "GET index" do
		render_views
    it "should show welcome message" do
      get :index
      assert_response :success
      expect(response).to render_template("index")
      expect(response.code).to eq("200")
    end
  end
end