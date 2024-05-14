require "rails_helper"

describe Vehicle do
    describe 'relationships' do
        it { should belong_to :dealership } 
    end

    describe 'class methods' do
        describe '.pre_owned' do
            it 'returns all vehicles that are pre-owned' do
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

                expect(Vehicle.pre_owned).to eq([vehicle_1])
            end
        end
        describe '.electric' do
            it 'returns all vehicles that are electric' do
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
                    electric: true,
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

                expect(Vehicle.electric).to eq([vehicle_1])
            end
        end
    end
end