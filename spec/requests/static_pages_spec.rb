require 'spec_helper'

describe "static_pages" do

  subject { page }

  describe "home page" do
    # 1. Visit the home page
    before { visit home_path }
    # 2. it should have a h1 tag of "Welcome"
    it { should have_selector('h1', "Life!Fuel") }
    # 3. it should have a title of "Todo | Home"
    it { should have_title("Life!Fuel | Home") }    
  end

  describe "search" do
    before { visit search_path }
    # it should have a h1 tab of "About Me"
    it { should have_selector('h1', "What Will Motivate You?") } 
    # it should have a title of "Todo | About Me"
    it { should have_title("Life!Fuel | Search") }
  end

  describe "favorites" do
    before { visit favorites_path }
    # it should have h1 of "Help /FAQ"
    it { should have_selector('h1', "My Favorites") }
    # it should have a title of "Todo | Help"
    it { should have_title("Life!Fuel | Favorites") }
  end
end