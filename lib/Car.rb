class Car < ActiveRecord::Base
    belongs_to :customer
    belongs_to :dealership

    def self.all_cars_for_sale
      self.all.select{|car| car.customer_id == nil}
    end
    def self.all_sold_cars
      self.all.select{|car| car.customer_id != nil}
    end


      # returns a list of cars with the same make a dealership has
    def self.search_by_make(make)
        self.all_cars_for_sale.select { |car| car.make.downcase == make}
        # dealership_cars(dealership).select{ |car| car.make == make}
    end

    # returns available cars in hash with index 
    def self.cars_available_hash 
        cars = {}
        all_cars_for_sale.each_with_index do |car, index|
                cars[index+1] = car
        end  
        cars
    end

    
    # returns a car with the name of the customer who bought the car
    def buy_car(customer_instance)
      self.customer_id = customer_instance.id
      self
    end

end