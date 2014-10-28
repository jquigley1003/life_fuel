require 'spec_helper'

describe StaticPagesController, type: :controller do
  describe "home" do
    it "renders home" do
      get :home
      expect(response).to render_template(:home)
    end
  end

  describe "search" do
    it "renders search" do
      get :search
      expect(response).to render_template(:search)
    end   
  end

  describe "favorites" do
    it "renders favorites" do
      get :favorites
      expect(response).to render_template(:favorites)
    end    
  end
end