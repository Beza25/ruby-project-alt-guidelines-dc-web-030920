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

    

    # car is sold 
    # def sell_car(customer)
    #     Car.all.select do |car|
    #          car.customer_id == nil     
    #     end.
        
            
        
    # end


    # def dealership_cars(dealership_name)
    #     .select{ |car|  }

    # end



end
