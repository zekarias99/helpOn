require 'spec_helper'

describe "Fine print" do
  describe "(index/fine_print)" do
    describe "Viewing the list of fine_prints" do
      it "shows the fine_prints" do

        fine_print_of_bench_prepare = FinePrint.create(fine_print_attributes)
        fine_print_of_peep_cod     = FinePrint.create(fine_print_attributes)

      visit fine_prints_url

      expect(page).to have_text('The Fine Print')
      expect(page).to have_text(fine_print_of_bench_prepare.description)
      expect(page).to have_text(fine_print_of_peep_cod.description)
      end
    end
  end

  describe "(show/fine_prints)" do
    describe "Viewing an individual fine print" do
      it "shows the fine print's details" do

        fine_print = FinePrint.create(fine_print_attributes)

        visit fine_print_url(fine_print)

        expect(page).to have_text(fine_print.description)
      end
    end    
  end   

  describe "Nevigation" do
    describe "Nevigating fine print" do
      it "allows navigation from the detail page to the listing page" do

        fine_print = FinePrint.create(fine_print_attributes)

        visit fine_print_url(fine_print)

        click_link "List All Fine Prints"
        
        expect(current_path).to eq(fine_prints_path)
      end

      it "allows navigation from the listing page to the detail page" do

        fine_print = FinePrint.create(fine_print_attributes)

        visit fine_prints_path

        click_link "Show"

        expect(current_path).to eq(fine_print_path(fine_print))
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

  describe "Create" do
    describe "Creating a new fine print" do
      it "should save the fine print and & shows the new fine print's details" do
        visit fine_prints_path

        click_link 'Add New Fine Print'

        expect(current_path).to eq(new_fine_print_path)

        fill_in "Description", with: "It may be vary "
      
        click_button "Create Fine print"

        expect(current_path).to eq(fine_print_path(FinePrint.last))

        expect(page).to have_content('Fine print has been created.')
      end
    end
  end

  describe "Delete" do
    describe "Deleting a fine print" do
      it "destroys the the fine print and shows the fine print listing" do
        fine_print_one = FinePrint.create(fine_print_attributes(description: 
        "Expires in 2 year May buy "))

        visit fine_print_path(fine_print_one)

        click_link 'Delete'

        expect(current_path).to eq(fine_prints_path)
        expect(page).not_to have_text(fine_print_one.description)
        # expect(page).to have_text("Fine Print successfully deleted!")
      end
    end
  end
end