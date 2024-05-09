require "rails_helper"

describe Dealership do
    describe 'relationships' do
        it { should have_many :vehicles } 
    end
end