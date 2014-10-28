require 'spec_helper'

describe "users" do

  subject { page }

  describe "signup page GET /signup:" do
    before { visit signup_path }

    it { should have_title("Life!Fuel | Sign Up") }
    it { should have_selector('h1', text: "Get Ready to Find Your Life!Fuel") }

    # describe "signup POST /users" do
    #   let(:submit) { "Done" }

    #   context "valid information" do
    #     before do
    #       User.destroy_all
    #       fill_in "Name",     with: "Jeff Quigley"
    #       fill_in "Email",    with: "jeff.quigley@wavinghi.com"
    #       fill_in "Password", with: "foobar"
    #       fill_in "Password confirmation", with: "foobar"
    #     end

    #     it "creates user" do
    #       expect { click_button submit }.to change(User, :count).by(1)
    #     end
        
    #     describe "after submission" do

    #       before { click_button submit }
    #         it { should have_title("Todo | Jeff") }
    #         it { should have_selector('h1', text: "Jeff") }
    #     end
    #   end

    #   context "invalid information" do
    #     it "does not create user" do
    #     expect { click_button submit }.not_to change(User, :count)
    #     end

    #     describe "after submission" do
    #       before { click_button submit }

    #       it { should have_title('Todo | Sign Up') }
    #       it { should have_content('error') }
    #     end
    #   end
    # end
  end

  # describe "show page GET /users/:id" do
  #   before do
  #     User.destroy_all
  #     user = FactoryGirl.create(:user, name: "Jeff", email: "jeff@gmail.com")
  #     visit user_path(user.id)
  #   end

  #   it { should have_title("Todo | Jeff") }
  #   it { should have_selector('h1', text: "Jeff") }
  #   it { should have_selector('p', text: "Email: jeff@gmail.com")}
  # end
end