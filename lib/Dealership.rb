

class Dealership < ActiveRecord::Base
    has_many :cars
    has_many :customers, through: :cars
    
    

    #returns a list of all sold cars
    def sold_cars 
        cars.select do |car| 
            car.customer_id != nil    
        end
    end

    def total_sale
        total = 0
        sold_cars.each do |car|
            total += car.price
        end
        total
    end

   def self.dealership_hash
    dealership_list = {}
    self.all.each_with_index do |dealership_info, index|
        dealership_list[index+1] = dealership_info
    end  
    dealership_list
   end

    def self.dealership_spec_car(dealership_name) 
        # iterate over Cars.all
        # select cars specfic to the dealership
         dealer = self.dealership (dealership_name)
          Car.all.select do |c|
          c.dealership_id == dealer.id 
        end
    end

    def self.dealership(dealership_name)
        self.all.find do |dealership|   
            dealership.name.downcase == dealership_name
         end
    end


    #returns a list of unsold cars
    def unsold_cars
        cars.select{ |car| car.customer_id == nil}
    end

    #returns the number of cars after selling
    def unsold_car_count 
        unsold_cars.count
    end


    # # returns all new cars for a dealership
    # def new_cars 
    #     cars.select { |car| car.status.downcase == "new"}
    # end

    # # returns all old cars fro a dealership
    # def used_cars
    #     cars.select { |car| car.status.downcase == "used"}
    # end




end 
