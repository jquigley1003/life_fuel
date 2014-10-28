require 'spec_helper'

describe "static_pages" do

  subject { page }

  describe "home page" do
    before { visit signin_path }
    it { should have_selector('h1', "Life!Fuel") }
    it { should have_title("Life!Fuel | Sign In") }    
  end

  describe "search" do
    before { visit search_path }
    it { should have_selector('h1', "What Will Motivate You?") } 
    it { should have_title("Life!Fuel | Search") }
  end

  describe "favorites" do
    before { visit favorites_path }
    it { should have_selector('h1', "My Favorites") }
    it { should have_title("Life!Fuel | Favorites") }
  end
end