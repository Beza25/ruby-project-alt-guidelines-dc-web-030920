
class CommandLine

  


  def welcome
    puts "Welcome to our App" 
    puts "*********************" 
    puts "Please enter a customer name"
  end
  
  # return a string that a user puts
  def get_character_from_user
  
    # tells the user to get data from the command line
    name = gets.chomp.to_str
    # use gets to capture the user's input. This method should return that input, downcased.
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
  
  
  def user_type
    puts "Enter 1 to if you are a customer."
    puts "Enter 2 if you an employee"

  end
  
  
  
  
  def first_options
  
    puts "Enter 1 to see all the car lists."
    puts "Enter 2 if you are a cutomer"
    puts "Enter 3 if you like to access employee information"
    response = gets.chomp.to_i
    puts "#################################"
  
    if response == 1
       Car.all.each_with_index do |car, index|
      
        puts "#{index+1}.       Make: #{car.make}       Model: #{car.model}       Year: #{car.year}       Price: $#{car.price}\n"
       end
    elsif response == 2
      customer
      # If 2 prompt to see either dealership list, or car
      

    elsif responce == 3  
      #  ask to search by dealership
      
  
    end
  end

  def customer 
    puts  "Enter 1 to search by dealerships " 
    puts "Enter 2 to search by car"
    puts "Enter 0 to go back to main menu"
    custromer_response = gets.chomp.to_i
    # return 
    if custromer_response == 1
      dealerships_or_cars

    elsif custromer_response == 2
      # do something
    
    elsif customer_responce == 0
      first_options
    end
  end
  
  def car_lists
    
    # Car.all
    # binding.pry
    # puts "cars"z
  
  end
  
  def dealerships_or_cars
    puts "Enter 1 to see all dealerships " 
    puts "Enter 2 to search a cars"
    puts "Enter 0 to go back to main menu"
    d_or_car = puts.chomp.to_i
    if   d_or_car == 1 
      delarships_list

    elsif d_or_car == 2
      # Something happens

    elsif d_or_car == 0
      first_options
    end
   
      
    end
      user_dealership = gets.chomp.to_str.downcased

  end

  def delarships_list
    puts " Enter 1  to see all cars a dealership has" 
    puts " Enter 2 to search a dealership by name " 
    puts "Enter 0 to go back to main menu"
    delarships_response = puts.chomp.to_i

    if delarships_response == 1 
      Dealership.all.each_with_index do |dealership, index|
      puts "#{index+1}. #{dealership.name} located at #{dealership.location}\n"
      elsif delarships_response == 2
      puts "Enter the name of the dealership"
      

      elsif delarships_response == 0
        first_options
      
      
    end
    
    
    
    
  end

  
  
  # puts " Do you want to see the list of cars a dealership has?"
  
  
  
  

end


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
  #          - the particular dealership
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
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            