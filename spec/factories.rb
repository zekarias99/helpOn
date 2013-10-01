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
  factory :company do
    business_name                            "Wanza Bar"
    email_address                            "wanza@helpon.com"
    first_name                               "Teshome"      
    last_name                                "Araya"
    address_1                                "3022 NE"
    address_2                                "2022 NE"
    state                                    "Dessie"
    zip                                       1264
    country                                  "USA"
    phone                                    2064534565
    website                                  "www.wanza.com"
    pick_a_category                          "Hotel"
    where_do_you_want_your_helpon_to_run     "At Dessie"
    tell_us_a_little_bit_about_your_business  "We are owsome!!"
    review_links                             "www.helpon.com"
  end
end