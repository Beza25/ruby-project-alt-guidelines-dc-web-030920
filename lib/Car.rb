class Car < ActiveRecord::Base
    belongs_to :customer
    belongs_to :dealership

    

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
