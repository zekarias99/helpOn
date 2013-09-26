namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    make_users
    make_microposts
    make_relationships
    # make_charities
  end
end

def make_users
  admin = User.create!(name: "Example User",
               email: "example@helpon.com",
               password: "foobar",
               password_confirmation: "foobar", admin: true)
  99.times do |n|
    name  = Faker::Name.name
    email = "example-#{n+1}@helpon.com"
    password  = "password"
    User.create!(name: name,
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
end

# def make_charities
#   users = User.all(limit: 3)
#   50.times do
#     description                   = Faker::Lorem.sentence(5),
#     charity_name                  = "UNHCR",  
#     registered_charity_number     = 111048, 
#     first_name                    = "Foo", 
#     last_name                     = "Bar",  
#     job_title                     = "Manager", 
#     email_address                 = "manager@unhcr.gov",
#     telephone_number              = 111048,
#     i_agree_to_the                = true,
#     address_1                     = 3022 ,
#     address_2                     = 3022,
#     state                         = "Seattle",
#     zip                           = 98125,
#     country                       = "USA",
#     website                       = "unhcr.org",
#     pick_a_category               = "International",
#     city_id                       = 1
#     users.each { |user| user.charities.create!(description: description,
#                                                charity_name: charity_name,
#                       registered_charity_number: registered_charity_number,
#                               first_name: first_name, last_name: last_name,                
#                         job_title: job_title, email_address: email_address,
#         telephone_number: telephone_number, i_agree_to_the: i_agree_to_the,
#                    address_1: address_1, address_2: address_2, state: state,
#                                zip: zip, country: country, website: website,
#                          pick_a_category: pick_a_category, city_id: city_id) }
#   end
# end

def make_relationships
  users = User.all
  user = users.first
  joined_users = users[2..50]
  joiners      = users[3..40]
  joined_users.each { |joined| user.join!(joined) }
  joiners.each      { |joiner| joiner.join!(user)}
end
