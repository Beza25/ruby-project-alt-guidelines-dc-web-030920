
class CommandLine

  def present_cars(object)
   object.each_with_index do |car, index|
    puts "#{index+1}.       Make: #{car.make}       Model: #{car.model}       Year: #{car.year}       Price: $#{car.price}\n"
    end
  end
  
    def present_dealerships(object) 
      object.each_with_index do |dealership, index|
        puts "#{index+1}. #{dealership.name} located at #{dealership.location}\n"
        
      end
    end
    
 

 

  def welcome
    puts "**********************************************************" 
    puts "*                 Welcome to Our App                     *" 
    puts "**********************************************************" 
    puts ""
    puts "------ At any time, enter 0 to return to the main menu ------"
    
    puts " Please enter a customer name"
  end
  
  # return a string that a user puts
  def get_character_from_user
    name = gets.chomp.to_str
  end


  
  # creates a new custormer with the name given
  # saves the customer to the database
  def save_customer
    customer = get_character_from_user
  
    @customer = Customer.all.find do |cust|
      cust.name == customer
    end
    if !@customer
      @customer = Customer.create(name: customer)
      @customer
  
    end
   
  end
  
  
  def first_options
    # puts "Enter 1 to see all the car lists."
    puts " Enter 1 if you are a customer"
    puts " Enter 2 if you are an employee"
    
    
    response = gets.chomp.to_i
    puts "#################################"
  
    # if response == 1
    #  present_cars(Car.all)

    if response == 1
      customer
      # If 2 prompt to see either dealership list, or car
    elsif response == 2  
      #  ask to search by dealership
    elsif response == 0
      first_options   
    end

  end

  def customer 
    puts " Enter 1 to search through dealership data" 
    puts " Enter 2 to search through all car data"
    puts " Enter 3 to purchase a car"
  
    ##----THIS IS MORE ELEGANT THAN ELSIF---##
    # case customer_response = gets.chomp.to_i
    # when 0
    # first_options
    # when 1
    #   dealerships_list
    # when 2
        # car_lists
    # when 3
    # customer_buy_car

    # else
      # "Error: Invalid entry! (#{customer_response = gets.chomp.to_i})"
    # end

    customer_response = gets.chomp.to_i
    # return 
    if customer_response == 1
      dealerships_list

    elsif customer_response == 2
      car_lists
    elsif customer_response == 3 
      customer_buy_car
    
    elsif customer_response == 0
      first_options
    end
  end

  def customer_buy_car 
    puts " Enter the number of the car you wish to purchase"
    # available_cars = Car.all_cars_for_sale
    # present_cars(available_cars)
    
   

    Car.cars_available_hash.each do |index, car|
      puts "#{index}.       Make: #{car.make}       Model: #{car.model}       Year: #{car.year}       Price: $#{car.price}\n"
    end
    buy_this_car = gets.chomp.to_i
    
    buy = Car.cars_available_hash.find do |key, car|
      
      buy_this_car == key
     
    end
    buy = buy[1]
  
    purchased_car = Car.buy_car(@customer, buy)
  
    puts "Congratulations! #{@customer.name} you now own a #{purchased_car.status} #{purchased_car.make}, #{purchased_car.model}!"
    puts "Customer_id: #{purchased_car.customer_id}"
    goodbye
  end
  
  def car_lists
    puts " Enter 1 to see a list of all available cars" 
    puts " Enter 2 to search the cars by make"
    car_response = gets.chomp.to_i

    
    if car_response == 1
      cars = Car.all_cars_for_sale
      present_cars(cars)
      goodbye
      
    elsif car_response == 2
      puts " Enter the make of the car"
      make_response = gets.chomp.to_str.downcase
      cars = Car.search_by_make(make_response)
      present_cars(cars)
      goodbye
    end
  end
  
  ##----THIS IS MORE ELEGANT THAN ELSIF---##
# case car_response = gets.chomp.to_i
    # when 1
#       cars = Car.all_cars_for_sale
#       present_cars(cars)
#       goodbye
    # when 2
        # puts " Enter the make of the car"
        # make_response = gets.chomp.to_str.downcase
        # cars = Car.search_by_make(make_response)
        # present_cars(cars)
        # goodbye
    # else
      # " Error: Invalid entry! (#{car_response = gets.chomp.to_i})"
    # end
    
  def dealerships_list
    puts " Enter 1 to see a list of all the dealerships" 
    puts " Enter 2 to search the inventory by dealership name" 
    dealerships_response = gets.chomp.to_i

    if dealerships_response == 1 
      present_dealerships(Dealership.all)
      goodbye

    elsif dealerships_response == 2
      puts " Enter the name of the dealership"
      dealership_cars = gets.chomp.to_str.downcase
      cars = Dealership.dealership_spec_car(dealership_cars) 
      present_cars(cars)
      goodbye
      # uniq_dealership = gets.chomp.to_str.downcase
      # dealer = Dealership.dealership(uniq_dealership)
      # binding.pry
      # dealer.each_with_index do |dealership, index| 
      # puts "#{index+1}. #{dealer.name} located at #{dealer.location}\n"
      # end
      
    elsif dealerships_response == 0
        first_options   
    end   
  ##----THIS IS MORE ELEGANT THAN ELSIF---##
    # case dealership_response = gets.chomp.to_i
    # when 0
    #   first_options
    # when 1
    #   present_dealerships(Dealership.all)
    #   goodbye
    # when 2
    #       puts " Enter the name of the dealership"
    #       dealership_cars = gets.chomp.to_str.downcase
    #       cars = Dealership.dealership_spec_car(dealership_cars) 
    #       present_cars(cars)
    #       goodbye
    # else
      # " Error: Invalid entry! (#{dealership_response = gets.chomp.to_i})"
    # end

  end
  
  def goodbye
    puts "-------------------------------------------Goodbye--------------------------------------------"
  end
end
  # def dealerships_or_cars
  #   puts " Enter 1 to see dealerships options" 
  #   puts " Enter 2 to search a cars"
 
  #   d_or_car = gets.chomp.to_i
  #   if   d_or_car == 1 
  #     dealerships_list

  #   elsif d_or_car == 2
  #     # Something happens

  #   elsif d_or_car == 0
  #     first_options
  #   end
  #     # user_dealership = gets.chomp.to_str.downcase

  # end




# welcome
#   - list all cars
    # 1 if customer
    #   1.1 car options
    #       1.1.1 list all cars
    #       1.1.2 search cars by make
    # 
    #   1.2 dealership options
    #       1.2.1 list of all dealerships
    #       1.2.2 search inventory by dealership
    #           - list cars by make : option to buy car
    #   1.3 buy car
                #sort by make
                #sort by price
                #sort by condition
    
                
    # 2 if employee







# welcome
# - look at all car
# -employee
#   -dealership
#     -sold cars in dealership
#     -sold cars count
# -customer
#  * 1 = search by dealerships 
  #   - search by dealerships
  #      * 1 = all delarships
  #         - Display all Dealerships
  #             * 1 = chose your favorite dealership and go back so that you can search using your favorite dealership
  #      * 2 = find the dealership of user's desire (user_dealership)
  #          
  #             * 1 = all cars in this dealership
  #                    - shows all the cars
  #             * 2 = search car by make   (user_make )
  #                    - show all cars that match the make provided by user
  #                         * 1 = buy car
  #                               - car belongs to customer 
  #                         * 2 = don't buy car
  #                                - exit out 
#  * 2 = Search by cars                      
#     -new cars 
#     -old cars
#     -search by make
#     -buy car
#   - search by all cars
#     new cars
#     old cars
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            