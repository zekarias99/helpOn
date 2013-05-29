require 'spec_helper'

describe "Highlight pages" do
  describe "(index/highlight = highlights_url)" do
    describe "Viewing the list of highlights" do
      it "shows the highlights" do

        highlight_hotel = Highlight.create(highlight_attributes)
        highlight_store = Highlight.create(highlight_attributes)

      visit highlights_url

      expect(page).to have_text('Description')
      expect(page).to have_text(highlight_hotel.description)
      expect(page).to have_text(highlight_hotel.deal_id)
      expect(page).to have_text(highlight_store.description)
      expect(page).to have_text(highlight_store.deal_id)
      end
    end
  end

  describe "(show/highlight = highlight_url(highlight))" do
    describe "Viewing an individual highlight" do
      it "shows the highlight's details" do

        highlight = Highlight.create(highlight_attributes)

        visit highlight_url(highlight)

        expect(page).to have_text(highlight.description)
      end
    end    
  end   

  describe "Nevigation" do
    describe "Nevigating highlight" do
      it "allows navigation from the detail page to the listing page" do

        highlight = Highlight.create(highlight_attributes)

        visit highlight_url(highlight)

        click_link "View All"
        
        expect(current_path).to eq(highlights_path)
      end

      it "allows navigation from the listing page to the detail page" do

        highlight = Highlight.create(highlight_attributes)

        visit highlights_path

        click_link "Show"

        expect(current_path).to eq(highlight_path(highlight))
      end
    end
  end

  describe "Eddit" do
    describe "Editing a highlight" do  
      it "updates the highlight and shows the highlight's updated details" do

        highlight = Highlight.create(highlight_attributes(description: 
        "Expires in 1 year May buy "))


        visit highlights_path
        
        click_link "Edit"
        
        expect(current_path).to eq(edit_highlight_path(highlight))
            
        expect(find_field('Description').value).to eq(highlight.description)

        fill_in "Description", with: "Expires in 1 year May buy mult.."

        click_button 'Update Highlight'

        expect(current_path).to eq(highlight_path(highlight))

        expect(page).to have_text('Successfully updated highlight.')
      end  
    end    
  end

  describe "Create" do
    describe "Creating a new highlight" do
      it "should save the highlight and & shows the new highlight's details" do

        visit highlights_path

        click_link 'New Highlight'

        expect(current_path).to eq(new_highlight_path)

        fill_in "Description", with: "It may be vary "

        fill_in "Deal", with: 42
      
        click_button "Create Highlight"

        expect(current_path).to eq(highlight_path(Highlight.last))

        expect(page).to have_content('Successfully created highlight.')
      end
    end
  end

  describe "Delete" do
    describe "Deleting a highlight" do
      it "destroys the the highlight and shows the highlight listing" do

        highlight_delete = Highlight.create(highlight_attributes(description: 
        "Expires in 2 year May buy ", deal_id: 42))

        visit highlight_path(highlight_delete)

        click_link 'Delete'

        expect(current_path).to eq(highlights_path)
        expect(page).not_to have_text(highlight_delete.description)
        expect(page).to have_text("Successfully destroyed highlight.")
      end
    end
  end
end
