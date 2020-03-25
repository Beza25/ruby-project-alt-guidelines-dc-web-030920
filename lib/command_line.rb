
class CommandLine

  def present_cars (object)
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
    puts "*             Welcome to Our App                         *" 
    puts "**********************************************************" 
    puts ""
    puts " ------ any time, enter 0 to get back to this menu ------"
    
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
    end
  end
  
  
  def first_options
    # puts " Enter 1 to see all the car lists."
    puts " Enter 1 if you are a cutomer"
    puts " Enter 2 if you are an employee1"
    
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
    puts " Enter 3 to buy a car "
  
    customer_response = gets.chomp.to_i
    # return 
    if customer_response == 1
      dealerships_list

    elsif customer_response == 2
      car_lists
    elsif customer_response == 3 
      "Create buy method"
    
    elsif customer_response == 0
      first_options
    end
  end
  
  def car_lists
    puts " Enter 1 to see list of all available cars" 
    puts " Enter 2 to search cars by make"
    car_response = gets.chomp.to_i

    if car_response == 1
      cars = Car.all_cars_for_sale
      present_cars(cars)
      goodbye
    
    elsif car_response == 2
      puts " Enter the make of car"
      make_response = gets.chomp.to_str.downcase
      cars = Car.search_by_make(make_response)
      present_cars(cars)
      goodbye
    end
  end


  def dealerships_list
    puts " Enter 1  to see list of all dealerships" 
    puts " Enter 2 to search inventory by dealership name " 
    dealerships_response = gets.chomp.to_i

    if dealerships_response == 1 
      present_dealerships(Dealership.all)
      goodbye

    elsif dealerships_response == 2
      puts "Enter the  of the dealership"
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
  end
  
  def goodbye
    puts "-------------------------------------------Good Bye--------------------------------------------"
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
  #     # user_dealership = gets.chomp.to_str.downcased

  # end




# welcome
#   - list all cars
    # 1 if cutomer
    #   1.1 car options
    #       1.1.1 list all cars
    #       1.1.2 search cars by make
    # 
    #   1.2 dealership options
    #       1.2.1 list of all dealerships
    #       1.2.2 search inventory by dealership
    #           - list cars by make : option to buy car
    #   1.3 buy car
                # sort by make
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
  #         - Display all Dealership
  #             * 1 = chose your favorite dealership and go back so that you can search using your favourite dealership
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
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            