class Customer < ActiveRecord::Base
    has_many :cars
    has_many :dealerships, through: :cars
end