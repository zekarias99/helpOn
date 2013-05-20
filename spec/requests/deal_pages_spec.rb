require 'spec_helper'

describe "Deals page" do
  describe "(index/deals)" do
    describe "Viewing the list of deals" do
      it "shows the deals" do

        deal1 = Deal.create(deal_attributes)

        deal2 = Deal.create(deal_attributes(name: "Snack Bar")) 

        deal3 = Deal.create(deal_attributes(name: "Hotel")) 

      visit root_path

      expect(page).to have_text('3 Deals')
      expect(page).to have_text(deal1.name)
      expect(page).to have_text(deal2.name)
      expect(page).to have_text(deal3.name)

      expect(page).to have_text(deal1.regular_price)
      expect(page).to have_text(deal1.initial_discount)
      expect(page).to have_text(deal1.max_discount)
      expect(page).to have_text(deal1.max_threshold)
      expect(page).to have_text(deal1.approved)
      expect(page).to have_text(deal1.deal_date)
      expect(page).to have_text(deal1.photo_file_name)
      expect(page).to have_text(deal1.blurb_title)
      expect(page).to have_text(deal1.blurb)
      expect(page).to have_text(deal1.deal_type)
      expect(page).to have_text(deal1.tipping_point)
      expect(page).to have_text(deal1.end_date)
      end
    end
  end
  
  describe "(show/deals)" do
    describe "Viewing an individual deal" do
      it "shows the deal's details" do
        deal = Deal.create(deal_attributes)

        visit deal_url(deal)

        expect(page).to have_text(deal.regular_price)
        expect(page).to have_text(deal.initial_discount)
        expect(page).to have_text(deal.max_discount)
        expect(page).to have_text(deal.max_threshold)
        expect(page).to have_text(deal.approved)
        expect(page).to have_text(deal.deal_date)
        expect(page).to have_text(deal.photo_file_name)
        expect(page).to have_text(deal.blurb_title)
        expect(page).to have_text(deal.blurb)
        expect(page).to have_text(deal.deal_type)
        expect(page).to have_text(deal.tipping_point)
        expect(page).to have_text(deal.end_date)
      end

      it "shows regular_price"
      it "shows initial_price"
    end    
  end

  describe "Nevigation" do
    describe "Nevigating deals" do
      it "allows navigation from the detail page to the listing page" do

        deal = Deal.create(deal_attributes)

        visit deal_url(deal)

        click_link "List All Deals"
        
        expect(current_path).to eq(root_path)
      end

      it "allows navigation from the listing page to the detail pa" do

        deal = Deal.create(deal_attributes)

        visit root_path

        click_link deal.name

        expect(current_path).to eq(deal_path(deal))
      end
    end
  end
end