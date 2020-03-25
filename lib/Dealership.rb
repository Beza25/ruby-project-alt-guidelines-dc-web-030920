

class Dealership < ActiveRecord::Base
    has_many :cars
    has_many :customers, through: :cars
    
    

    #returns a list of all sold cars
    def sold_cars 
        cars.select{ |car| car.customer_id != nil}
    end


    # go through the unsold cars 
    # if custormer's choice of car is inside the unsold cars
    # assign the cutomer to that car
    # (customer, car_id )
    # car.customer_id = customer
    def sell_car(customer, car )
        unsold_cars.select do  |c| 
            c.id  == car.id  
            c.customer_id = customer.id
        end
    end



    # returns all new cars for a dealership
    def new_cars 
        cars.select { |car| car.status.downcase == "new"}
    end

    # returns all old cars fro a dealership
    def used_cars
        cars.select { |car| car.status.downcase == "used"}
    end

    #returns a list of unsold cars
    def unsold_cars
        cars.select{ |car| car.customer_id == nil}
    end

    #returns the number of cars after selling
    def unsold_car_count 
        unsold_cars.count
    end




end 
