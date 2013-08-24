namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    admin = User.create!(name: "Zekarias",
                 last_name: "Aray",
                 email: "helpOn4@helpon.com",
                 password: "foobar",
                 password_confirmation: "foobar", admin: true)
    99.times do |n|
      name  = Faker::Name.name
      last_name = "last_name"
      email = "example-#{n+1}@helpon4.com"
      password  = "password"
      User.create!(name: name,
                   last_name: last_name,
                   email: email,
                   password: password,
                   password_confirmation: password)
    end

    user = User.all(limit: 6)
    50.times do
      content = Faker::Lorem.sentence(5)
      user.each { |user| user.statuses.create!(content) }
    end
  end
end