class Customer < ActiveRecord::Base
    # return all the cars for a customer
    has_many :cars
    has_many :dealerships, through: :cars

    # Returns all the cars a dealership has on the lot

    def dealership_cars (dealership) 
        # iterate over Cars.all
        # select cars specfic to the dealership
         Car.all.select { |car| car.dealership_id == dealership.id }
    
    end
    # returns a list of cars with the same make a dealerhip has
    def search_by_make (dealership, make)
        dealership_cars(dealership).select{ |car| car.make == make}
    end
    
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