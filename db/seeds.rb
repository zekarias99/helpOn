# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


Deal.create!([
  {
    name:"Hotel",
    regular_price:145.00, 
    initial_discount:50 ,
    max_discount:25 ,
    max_threshold:30 ,
    approved: true,
    deal_date:"2013-05-08",
    photo_file_name:"iron_river.jpg",
    blurb_title:"Come and Enjoy",
    blurb:"Come And Enjoy the beutiful whether of Portland.",
    deal_type:"Hotel",
    tipping_point:200,
    end_date:2.days.from_now
  },
  {
    name:"Snack",
    regular_price:20.00, 
    initial_discount:10 ,
    max_discount:25 ,
    max_threshold:30 ,
    approved: true,
    deal_date:"2013-06-08",
    photo_file_name:"tropical.JPG",
    blurb_title:"Come and Enjoy",
    blurb:"Come And Enjoy the beutiful whether of Portland.",
    deal_type:"Hotel",
    tipping_point:200,
    end_date:2.days.from_now
  }
])