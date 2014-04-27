require 'spec_helper'

describe "PhotosPages" do
  describe "index page" do
    it "should have the content 'photos/index'" do
      visit '/photos/'
    end
  end
end
