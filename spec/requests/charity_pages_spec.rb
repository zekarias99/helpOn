require 'spec_helper'

describe "Charity Pages" do
  describe "(index/charity = charities_url)" do
    describe "Viewing the list of charities" do
      it "shows the charities" do

        red_cross = Charity.create(charity_attributes)
        unhcr     = Charity.create(charity_attributes)

        visit charities_url

        expect(page).to have_text('Charities')
        expect(page).to have_text('State')
        expect(page).to have_text(hotel_feature.business_name)
        expect(page).to have_text(bar_feature.business_name)
        expect(page).to have_text(hotel_feature.state)
        expect(page).to have_text(bar_feature.state)
      end
      it "expect(page).to have_text('City')"
    end
  end

  describe "(show/company = company_url(company))" do
    describe "Viewing an individual company" do
      it "shows the company's details" do

        spa_feature = Company.create(company_attributes)
        visit company_url(spa_feature)
        expect(page).to have_text(spa_feature.business_name)
      end

      it "shows the company's details" do

        spa_feature = Company.create(company_attributes)

        visit companies_url

        click_link 'Show'

        expect(page).to have_text(spa_feature.business_name)
      end
    end    
  end   

  describe "Nevigation" do
    describe "Nevigating company" do
      it "allows navigation from the company page to the listing page" do

        bar_feature = Company.create(company_attributes)

        visit company_url(bar_feature)

        click_link "View All"
        
        expect(current_path).to eq(companies_path)
      end

      it "allows navigation from the listing page to the detail page" do

        hotel_feature = Company.create(company_attributes)

        visit companies_path

        click_link "Show"

        expect(current_path).to eq(company_path(hotel_feature))
      end
    end
  end

  describe "Eddit" do
    describe "Editing a company" do  
      it "updates the company and shows the companies's updated details" do

        book_feature = Company.create(company_attributes)

        visit companies_path
        
        click_link "Show"

        click_link 'Edit'
        
        expect(current_path).to eq(edit_company_path(book_feature))
            
        fill_in 'Business name',             with:     'Wanza Bar'
        fill_in 'Email address',             with:     'wanza@wanza.com'
        fill_in 'First name',                with:     'Wanza'
        fill_in 'Last name',                 with:     'Bar'
        fill_in 'Address 1',                 with:     '3322 140 th S.t'
        fill_in 'Address 2',                 with:     'NE Seattle'
        fill_in 'City',                      with:      2
        fill_in 'State',                     with:     'Seattle'
        fill_in 'Zip',                       with:     '98125'
        fill_in 'Country',                   with:     'USA'
        fill_in 'Phone',                     with:     '206 388 8482'
        fill_in 'Website',                   with:     'www.wanza.com'
        fill_in 'Pick a category',           with:     'Hotel'
        fill_in 'Review links',              with:     'www.alenalky.com'
        fill_in 'Where do you want your helpon to run', with: 'Asmara'
        fill_in 'Tell us a little bit about your business', with: 'Best!!'

        click_button 'Update Company'

        expect(current_path).to eq(companies_path)

        expect(page).to have_text('Successfully updated company.')
      end  
    end    
  end

  describe "Create" do
    describe "Creating a new feature" do
      it "should save the company and & shows the new companies details" do

        visit companies_path

        click_link 'New Company'

        expect(current_path).to eq(new_company_path)

        fill_in 'Business name',             with:     'Wanza Bar'
        fill_in 'Email address',             with:     'wanza@wanza.com'
        fill_in 'First name',                with:     'Wanza'
        fill_in 'Last name',                 with:     'Bar'
        fill_in 'Address 1',                 with:     '3322 140 th S.t'
        fill_in 'Address 2',                 with:     'NE Seattle'
        fill_in 'State',                     with:     'Seattle'
        fill_in 'Zip',                       with:     '98125'
        fill_in 'Country',                   with:     'USA'
        fill_in 'Phone',                     with:     '206 388 8482'
        fill_in 'Website',                   with:     'www.wanza.com'
        fill_in 'Pick a category',           with:     'Hotel'
        fill_in 'Review links',              with:     'www.alenalky.com'
        fill_in 'Where do you want your helpon to run', with: 'Asmara'
        fill_in 'Tell us a little bit about your business', with: 'Best!!'
      
        click_button "Create Charity"

        expect(current_path).to eq(charity_path(Charity.last))

        expect(page).to have_content('Successfully created company.')
      end
    end
  end

  describe "Delete" do
    describe "Deleting a company feature" do
      it "destroys the the company and shows the feature company listing" do

        feature_delete = Company.create(company_attributes)

        visit company_path(feature_delete)

        click_link 'Remove'

        expect(current_path).to eq(companies_path)
        expect(page).not_to have_text(feature_delete.business_name)
        expect(page).to have_text("Successfully removed company.")
      end
    end
  end
end
