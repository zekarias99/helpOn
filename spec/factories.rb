FactoryGirl.define do
  factory :user do
    sequence(:name)  { |n| "Person #{n}" }
    sequence(:email) { |n| "person_#{n}@example.com"}
    password "foobar"
    password_confirmation "foobar"

    factory :admin do
      admin true
    end
  end

  factory :micropost do
  	content "Lorem ipsum"
  	user
  end

  factory :charity do
    charity_name              "UNHCR"
    registered_charity_number "111048" 
    first_name                "Foo"
    last_name                 "Bar"
    job_title                 "Manager"
    email_address             "manager@unhcr.gov"
    telephone_number          "111048"
    i_agree_to_the            true
    description               "Human Right"
    address_1                 "3022 NE 140th St"
    address_2                 "3022 NE 140th St"
    state                     "Seattle"
    zip                       "98125"
    country                   "USA"
    website                   "unhcr.org"
    pick_a_category           "International"
    city_id                   "1"
    user
  end
end