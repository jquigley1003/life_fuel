require 'spec_helper'

describe User do
  before { @user = User.new(first_name: "Jeff", last_name: "Quigley", email: "jeff.quigley@Wavinghi.com",
                            password: "foobar", password_confirmation: "foobar") }

  subject { @user }

  it { should respond_to(:first_name) }
  it { should respond_to(:last_name) }
  it { should respond_to(:email) }
  it { should respond_to(:password_digest) }
  it { should respond_to(:password) }
  it { should respond_to(:password_confirmation) }
  it { should respond_to(:authenticate) }
  it { should respond_to(:remember_token) }
 #it { should respond_to(:tasks) } # @user.tasks --> an array of all tasks associated with that user
  it { should be_valid }

  describe "validations" do
    describe "first_name" do
      context "not present" do
        before { @user.first_name = " " }
        it { should_not be_valid }
      end

      context "too long" do
        before { @user.first_name = "a" * 51 }
        it { should_not be_valid }
      end
    end

    describe "last_name" do
      context "not present" do
        before { @user.last_name = " " }
        it { should_not be_valid }
      end

      context "too long" do
        before { @user.last_name = "a" * 51 }
        it { should_not be_valid }
      end
    end

    describe "email" do
      context "not present" do
        before { @user.email = " " }
        it { should_not be_valid }
      end

      context "too long" do
        before { @user.email = "a" * 201 }
        it { should_not be_valid }
      end

      context "correct format" do
        it "is valid" do
          addresses = %w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
          addresses.each do |valid_address|
            @user.email = valid_address
            expect(@user).to be_valid
          end
        end
      end

      context "incorrect format " do
        it "is invalid" do
          addresses = %w[user@foo,com user_at_foo.org example.user@foo.
                       foo@bar_baz.com foo@bar+baz.com foo@bar..com]
          addresses.each do |invalid_address|
            @user.email = invalid_address
            expect(@user).to_not be_valid
          end
        end
      end

      context "mixed case" do
        it "is saved as lowercase" do
          mixed_case_email = "fooBAR@exaMPlE.coM"
          @user.email = mixed_case_email
          @user.save
          expect(@user.reload.email).to eq mixed_case_email.downcase
        end
      end

      context "when already taken" do
        before do
          user_with_same_email = @user.dup
          user_with_same_email.save
        end

        it { should_not be_valid }
        
        User.destroy_all
      end
    end

    describe "password" do
      context "not present" do
        before { @user.password = @user.password_confirmation = " " }
        it { should_not be_valid}
      end

      context "too short" do
        before { @user.password = @user.password_confirmation = "a" * 5 }
        it { should_not be_valid }
      end

      context "doesn't match confirmation" do
        before { @user.password_confirmation = "mismatch" }
        it { should_not be_valid }
      end

      describe "return value of authenticate method" do
        before do
          User.destroy_all
          @user.save
        end

        let(:found_user) { User.find_by(email: @user.email) }

        context "with valid password" do
          it { should eq found_user.authenticate(@user.password) } # it == @user, 
        end

        context "with invalid password" do
          let(:user_for_invalid_password) { found_user.authenticate("invalid-password") }

          it { should_not eq user_for_invalid_password } # @user != user_for_invalid_password
          specify { expect(user_for_invalid_password).to be_falsey }
        end
      end
    end

    describe "remember token" do
      before do
        User.destroy_all
        @user.save
      end

      it "has a default value" do
        expect(@user.remember_token).to_not be_blank
      end
    end
  end

  # describe "associations" do
  #   describe "task" do
  #     before do
  #       User.destroy_all
  #       @user.save
  #       FactoryGirl.create(:task, user: @user)
  #     end

  #     context "on user destroy" do
  #       it "destroys all associated tasks" do
  #         tasks = @user.tasks.to_a # .to_a is probably not necessary
  #         @user.destroy
  #         expect(tasks).not_to be_empty
  #         tasks.each do |task|
  #           expect(Task.where(id: task.id)).to be_empty
  #         end
  #       end
  #     end
  #   end
  # end
end