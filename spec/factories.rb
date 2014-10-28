FactoryGirl.define do
  # factory :task do
  #   title       "Walk the dog"
  #   completed   false
  #   priority    (1..10).to_a.sample
  #   user
  # end

  sequence :first_name do |n|
    "first_name-#{n}"
  end

  sequence :last_name do |n|
    "last_name-#{n}"
  end

  sequence :email do |n|
    "email-#{n}@email.com"
  end

  factory :user do
    first_name
    last_name
    email
    password              "foobar"
    password_confirmation "foobar"
  end
end