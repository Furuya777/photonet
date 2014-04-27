require 'spec_helper'

describe "StaticPages" do
  describe "Home page" do
    it "should have the content 'home'" do
      visit '/'
    end
  end
  describe "Help page" do
    it "should have the content 'help'" do
      visit '/static_pages/help'
    end
  end
  describe "About page" do
    it "should have the content 'about'" do
      visit '/static_pages/about'
    end
  end
end
