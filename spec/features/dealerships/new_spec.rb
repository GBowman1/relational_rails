require "rails_helper"

describe "Dealerships New" do
    describe "As a visitor" do
        it "can route you to the new dealership form" do
            visit '/dealerships'

            click_link 'Add New Dealership'

            expect(current_path).to eq('/dealerships/new')
        end
        # User Story 11, Parent Creation 

        # As a visitor
        # When I visit the Parent Index page
        # Then I see a link to create a new Parent record, "New Parent"
        # When I click this link
        # Then I am taken to '/parents/new' where I  see a form for a new parent record
        # When I fill out the form with a new parent's attributes:
        # And I click the button "Create Parent" to submit the form
        # Then a `POST` request is sent to the '/parents' route,
        # a new parent record is created,
        # and I am redirected to the Parent Index page where I see the new Parent displayed.
        it "can create a new dealership and redirect to the dealership show page" do
            visit '/dealerships/new'

            fill_in 'dealershipName', with: 'Dealer 1'
            fill_in 'inputCity', with: 'City 1'
            fill_in 'daysOpen', with: 'Monday - Friday'
            fill_in 'inputRating', with: 4
            check 'militaryDiscount'

            click_button 'Create Dealership'

            expect(current_path).to eq("/dealerships")
            expect(page).to have_content('Dealer 1')
            expect(page).to have_content('City 1')
        end
    end
end