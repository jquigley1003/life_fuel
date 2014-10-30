require 'spec_helper'

describe "events" do

  subject { page }

  describe "search page" do
    before { visit search_path }
    it { should have_selector('h1', "What Will Motivate You?") }
    it { should have_title("Life!Fuel | Search Events") }    
  end

end