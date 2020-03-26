class Car < ActiveRecord::Base
    belongs_to :customer
    belongs_to :dealership

    def self.all_cars_for_sale
      self.all.select{|car| car.customer_id == nil}
    end


      # returns a list of cars with the same make a dealerhip has
    def self.search_by_make (make)
        self.all_cars_for_sale.select { |car| car.make.downcase == make}
        # dealership_cars(dealership).select{ |car| car.make == make}
    end

    # returns avaliable cars in hash with index 
    def self.cars_avalible 
        cars = {}
        all_cars_for_sale.each_with_index do |car, index|
                cars[index] = car
        end  
        cars
    end


    def self.buy_car(name, car)
        all_cars_for_sale.find do |c|
            c.id == car.id
            c.customer_id = name.id

        end
    end

    # car is sold 
    # def sell_car(customer)
    #     Car.all.select do |car|
    #          car.customer_id == nil     
    #     end.
        
   



    # whatever = gets the int of car that user wants

    #  self.car_avlible.each do |key,value|
      # if key == whatever
    #    value
    #   Car.buy_car (@customer, value )
        
    # end
  # end



# 



end
