class Vehicle < ApplicationRecord
    belongs_to :dealership

    def self.pre_owned
        where(pre_owned: true)
    end

    def self.electric
        where(electric: true)
    end
end