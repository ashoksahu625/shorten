require 'rails_helper'

RSpec.describe ShortensController, type: :controller do

  describe "GET shorten" do
    it "should get url for shorten" do
			shorten = create(:shorten)
			get "show", params: {slug: shorten.slug}
			expect(response).to be_redirect
		end
  end

  describe "GET all shorten" do
		it "get all urls for shorten" do
			shorten = create(:shorten)
			expect(response).to be_success
		end

  end

  describe "POST shorten" do
  	let(:params) do
  		{
			shorten: { url: Faker::Internet.url }
  		}
		end

		it "Create shorten" do
			post "create", :params => params, xhr: true
			expect(response).to be_success
		end
  end

end