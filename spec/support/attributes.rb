def deal_attributes(overrides ={})
  {
    name:"Book Deal",
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
  }.merge(overrides)
end

# Remember to add some deal attributes as needed