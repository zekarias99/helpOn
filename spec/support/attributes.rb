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

def fine_print_attributes(overrides = {})
  {
    description: "Expires in 1 year May buy multiple. Must register by the... ", 
    deal_id: 12
  }
end

def highlight_attributes(overrides = {})
  {
    description: "Nice place to be come and enjoy the sunny day of seattle ", 
    deal_id: 12
  }
end

def company_attributes(overrides = {})
  {
    business_name:        'Wanza Bar',
    email_address:        'wanza@wanza.com',
    first_name:           'Wanza',
    last_name:            'Bar',
    address_1:            '3322 140 th S.t',
    address_2:            'NE Seattle',
    city_id:               2,
    state:                'Seattle',
    zip:                  '98125',
    country:              'USA',
    phone:                '206 388 8482',
    website:              'www.wanza.com',
    pick_a_category:      'Hotel',
    review_links:         'www.alenalky.com',
    where_do_you_want_your_helpon_to_run: 'Asmara',
    tell_us_a_little_bit_about_your_business: 'We are one of the best in Beer!'
  }
end



# Remember to add some deal attributes as needed