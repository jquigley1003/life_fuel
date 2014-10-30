require 'rails_helper'

describe EventsController, type: :controller do

  describe "GET show" do
    let(:event) { FactoryGirl.create(:event, title: "Walk the dog") }

    it "renders :show" do
      get :show, id: event.id
      expect(response).to render_template(:show)
    end

    it "assigns requested event to @event" do
      get :show, id: event.id
      # Assigns @event to eq event that we defined on line 5
      assigns(:event).should eq(event)
    end
  end  

end
