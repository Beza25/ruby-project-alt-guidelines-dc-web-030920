class Dealership < ActiveRecord::Base
    has_many :cars
    has_many :customers, through: :cars
end 
