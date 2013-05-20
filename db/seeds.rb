# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)



Deal.create!([
  {
    name:"Hotel & Flight",
    regular_price:145.00, 
    initial_discount:50 ,
    max_discount:25 ,
    max_threshold:30 ,
    approved: true,
    deal_date:25.days.from_now,
    photo_file_name:"rails.png",
    blurb_title:"Come and Enjoy",
    blurb:"Come And Enjoy the beutiful whether of Portland.",
    deal_type:"Hotel",
    tipping_point:200,
    end_date:45.days.from_now
  },
  {
    name:"Snack Bar",
    regular_price:20.00, 
    initial_discount:10 ,
    max_discount:25 ,
    max_threshold:30 ,
    approved: true,
    deal_date:25.days.from_now,
    photo_file_name:"rails.png",
    blurb_title:"Come and Enjoy",
    blurb:"Come And Enjoy the beutiful whether of Portland.",
    deal_type:"Hotel",
    tipping_point:200,
    end_date:45.days.from_now
  },
  {
    name:"Restourant",
    regular_price:20.00, 
    initial_discount:10 ,
    max_discount:25 ,
    max_threshold:30 ,
    approved: true,
    deal_date:25.days.from_now,
    photo_file_name:"rails.png",
    blurb_title:"Come and Enjoy",
    blurb:"Come And Enjoy the beutiful whether of Portland.",
    deal_type:"Hotel",
    tipping_point:200,
    end_date:45.days.from_now
  },
  {
    name:"Wine Test",
    regular_price:20.00, 
    initial_discount:10 ,
    max_discount:25 ,
    max_threshold:30 ,
    approved: true,
    deal_date:25.days.from_now,
    photo_file_name:"rails.png",
    blurb_title:"Come and Enjoy",
    blurb:"Come And Enjoy the beutiful whether of Portland.",
    deal_type:"Hotel",
    tipping_point:200,
    end_date:45.days.from_now
  }
])
    