require 'spec_helper'

describe "City pages" do
  describe "(index/city_pages)" do
    describe "Viewing the list of cities" do
      it "shows the cities" do

        city = City.create(name: "Seattle")
        city2 = City.create(name: "Origon")

      visit cities_url

      expect(page).to have_text('List Cities')
      expect(page).to have_text(city.name)
      expect(page).to have_text(city2.name)

      end
    end
  end

  describe "(show/cities)" do
    describe "Viewing an individual city" do
      it "shows the cities detail" do

       city = City.create(name: 'Alabama')

        visit cities_url

        expect(page).to have_text(city.name)
      end
    end    
  end   


  describe "Eddit" do
    describe "Editing a fine print" do  
      it "updates the fine print and shows the fine print's updated details" do

        fine_print = FinePrint.create(fine_print_attributes(description: 
        "Expires in 1 year May buy "))


        visit fine_prints_path
        
        click_link "Edit"
        
        expect(current_path).to eq(edit_fine_print_path(fine_print))
            
        expect(find_field('Description').value).to eq(fine_print.description)

        fill_in "Description", with: "Expires in 1 year May buy mult.."

        click_button 'Update Fine print'

        expect(current_path).to eq(fine_print_path(fine_print))

        expect(page).to have_text('Fine Print successfully updated!')
      end  
    end    
  end

#   describe "Create" do
#     describe "Creating a new fine print" do
#       it "should save the fine print and & shows the new fine print's details" do

#         visit fine_prints_path

#         click_link 'Add New Fine Print'

#         expect(current_path).to eq(new_fine_print_path)

#         fill_in "Description", with: "It may be vary "

#         fill_in "Deal", with: 42
      
#         click_button "Create Fine print"

#         expect(current_path).to eq(fine_print_path(FinePrint.last))

#         expect(page).to have_content('Fine print has been created.')
#       end
#     end
#   end

#   describe "Delete" do
#     describe "Deleting a fine print" do
#       it "destroys the the fine print and shows the fine print listing" do
#         fine_print_one = FinePrint.create(fine_print_attributes(description: 
#         "Expires in 2 year May buy "))

#         visit fine_print_path(fine_print_one)

#         click_link 'Delete'

#         expect(current_path).to eq(fine_prints_path)
#         expect(page).not_to have_text(fine_print_one.description)
#         # expect(page).to have_text("Fine Print successfully deleted!")
#       end
#     end
#   end
end
