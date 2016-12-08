ENV["RACK_ENV"] = "test"
require_relative "../../lib/api/api"

### RSpec config
require "capybara/rspec"
require "webmock/rspec"

RSpec.configure do |config|
  config.include Capybara::DSL
end

Capybara.app = Api
###

describe "App" do
  describe "/" do
    it "works stuff" do
      visit "/"
      expect(page).to have_content "hello"
    end
  end

  describe "/google" do
    before do
      stub_request(:get, "http://google.com").to_return(status: 200, body: "not google")
    end

    it "retrieves the google main page" do
      visit "/google"
      expect(page).to have_content "not google"
    end
  end
end
