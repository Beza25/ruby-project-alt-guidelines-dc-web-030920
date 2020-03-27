class Customer < ActiveRecord::Base
    # return all the cars for a customer
    has_many :cars
    has_many :dealerships, through: :cars

    # Returns all the cars a dealership has on the lot
    # returns true if custormer has a car or false otherwise
  def bought_car 
    
      if cars.length > 0
      true
      else
      false
      end
  end

    # returns the number of cars a customer bought
  def count
      cars.length
  end
end