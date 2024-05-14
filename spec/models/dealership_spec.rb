require "rails_helper"

describe Dealership do
    describe 'relationships' do
        it { should have_many :vehicles } 
    end
    
    describe 'instance methods' do
        # User Story 16, Sort Parent's Children in Alphabetical Order by name 

        # As a visitor
        # When I visit the Parent's children Index Page
        # Then I see a link to sort children in alphabetical order
        # When I click on the link
        # I'm taken back to the Parent's children Index Page where I see all of the parent's children in alphabetical order
        describe '.alphabetical_order_make' do
            it 'returns a dealerships vehicles makes in alphabetical order' do
                dealer_1 = Dealership.create!(
                    review_rating: 4,
                    days_open: "Monday - Friday",
                    city: "City 1",
                    name: "Dealer 1", 
                    military_discount: true,
                    created_at: Time.now,  
                    updated_at: Time.now,
                )
                vehicle_1 = Vehicle.create!(
                    pre_owned: true,
                    electric: false,
                    price: 20000,
                    year: 2012,
                    horsepower: 230,
                    make: "Toyota",
                    model: "Camry",
                    img_url: "https://cars.usnews.com/static/images/Auto/izmo/332536/2012_toyota_camry_angularfront.jpg",
                    dealership: dealer_1
                )
                vehicle_2 = Vehicle.create!(
                    pre_owned: false,
                    electric: false,
                    price: 30000,
                    year: 2015,
                    horsepower: 300,
                    make: "Ford",
                    model: "F-150",
                    img_url: "https://cars.usnews.com/static/images/Auto/izmo/i2314306/2015_ford_f_150_angularfront.jpg",
                    dealership: dealer_1
                )

                expect(dealer_1.vehicles.alphabetical_order_make).to eq([vehicle_2, vehicle_1])
            end
        end
        describe '.alphabetical_order_model' do
            it 'returns a dealerships vehicles models in alphabetical order' do
                dealer_1 = Dealership.create!(
                    review_rating: 4,
                    days_open: "Monday - Friday",
                    city: "City 1",
                    name: "Dealer 1", 
                    military_discount: true,
                    created_at: Time.now,  
                    updated_at: Time.now,
                )
                vehicle_1 = Vehicle.create!(
                    pre_owned: true,
                    electric: false,
                    price: 20000,
                    year: 2012,
                    horsepower: 230,
                    make: "Toyota",
                    model: "Camry",
                    img_url: "https://cars.usnews.com/static/images/Auto/izmo/332536/2012_toyota_camry_angularfront.jpg",
                    dealership: dealer_1
                )
                vehicle_2 = Vehicle.create!(
                    pre_owned: false,
                    electric: false,
                    price: 30000,
                    year: 2015,
                    horsepower: 300,
                    make: "Ford",
                    model: "F-150",
                    img_url: "https://cars.usnews.com/static/images/Auto/izmo/i2314306/2015_ford_f_150_angularfront.jpg",
                    dealership: dealer_1
                )
                vehicle_3 = Vehicle.create!(
                    pre_owned: false,
                    electric: false,
                    price: 30000,
                    year: 2015,
                    horsepower: 300,
                    make: "Ford",
                    model: "Bronco",
                    img_url: "https://cars.usnews.com/static/images/Auto/izmo/i2314306/2015_ford_f_150_angularfront.jpg",
                    dealership: dealer_1
                )

                expect(dealer_1.vehicles.alphabetical_order_model).to eq([vehicle_3,vehicle_1, vehicle_2])
            end
        end
    end

end