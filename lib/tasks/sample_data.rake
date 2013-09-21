namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    make_users
    make_microposts
    make_relationships
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

def make_relationships
  users = User.all
  user = users.first
  joined_users = users[2..50]
  joiners      = users[3..40]
  joined_users.each { |joined| user.join!(joined) }
  joiners.each      { |joiner| joiner.join!(user)}
end
