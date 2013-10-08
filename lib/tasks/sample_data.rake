namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    make_users
    make_microposts
    make_relationships
  end
end

def make_users
  admin = User.create!(name: "Example",
               last_name: "User",
               email: "example@helpon.com",
               password: "foobar",
               password_confirmation: "foobar", admin: true)
  99.times do |n|
    name  = Faker::Name.name
    last_name  = Faker::Name.name
    email = "example-#{n+1}@helpon.com"
    password  = "password"
    User.create!(name: name,
                 last_name: last_name,
                 email: email,
                 password: password,
                 password_confirmation: password)
  end
end

def make_microposts
  users = User.all(limit: 3)
  50.times do
    content = Faker::Lorem.sentence(5)
    users.each { |user| user.microposts.create!(content: content) }
  end
    50.times do
    title = Faker::Lorem.sentence(1)
    users.each { |user| user.albums.create!(title: title) }
  end
    50.times do
    charity_name                  = "UNHCR",  
    registered_charity_number     = 111048, 
    address_1                     = "3022 NE" ,
    address_2                     = "3022 NE",
    state                         = "Seattle",
    zip                           =  98125,
    country                       = "USA",
    city                          = "Seattle",
    website                       = "unhcr.org",
    pick_a_category               = "International",
    description                   = Faker::Lorem.sentence(3),
    i_agree_to_the                = true
    users.each { |user| user.charities.create!(charity_name: charity_name,
                      registered_charity_number: registered_charity_number,
                                               address_1: address_1, 
                                               address_2: address_2, 
                                               state: state,
                                               zip: zip, 
                                               country: country, 
                                               city: city,
                                               website: website,
                                               pick_a_category: pick_a_category, 
                                               description: description,
                                               i_agree_to_the: i_agree_to_the) }
  end  
end

def make_relationships
  users = User.all
  user = users.first
  joined_users = users[2..50]
  joiners      = users[3..40]
  joined_users.each { |joined| user.join!(joined) }
  joiners.each      { |joiner| joiner.join!(user)}
end

