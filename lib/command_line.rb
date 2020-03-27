
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
    puts""
    puts ""
    puts "░██╗░░░░░░░██╗███████╗██╗░░░░░░█████╗░░█████╗░███╗░░░███╗███████╗   ████████╗░█████╗░"
    puts "░██║░░██╗░░██║██╔════╝██║░░░░░██╔══██╗██╔══██╗████╗░████║██╔════╝   ╚══██╔══╝██╔══██╗"
    puts "░╚██╗████╗██╔╝█████╗░░██║░░░░░██║░░╚═╝██║░░██║██╔████╔██║█████╗░░   ░░░██║░░░██║░░██║"
    puts "░░████╔═████║░██╔══╝░░██║░░░░░██║░░██╗██║░░██║██║╚██╔╝██║██╔══╝░░   ░░░██║░░░██║░░██║"
    puts "░░╚██╔╝░╚██╔╝░███████╗███████╗╚█████╔╝╚█████╔╝██║░╚═╝░██║███████╗   ░░░██║░░░╚█████╔╝"
    puts "░░░╚═╝░░░╚═╝░░╚══════╝╚══════╝░╚════╝░░╚════╝░╚═╝░░░░░╚═╝╚══════╝   ░░░╚═╝░░░░╚════╝░"
    puts""   
    puts "░█████╗░██╗░░░██╗██████╗░   ░█████╗░░█████╗░██████╗░   ░█████╗░██████╗░██████╗░"
    puts "██╔══██╗██║░░░██║██╔══██╗   ██╔══██╗██╔══██╗██╔══██╗   ██╔══██╗██╔══██╗██╔══██╗"
    puts "██║░░██║██║░░░██║██████╔╝   ██║░░   ███████║██████╔╝   ███████║██████╔╝██████╔╝"
    puts "██║░░██║██║░░░██║██╔══██╗   ██║░░██╗██╔══██║██╔══██╗   ██╔══██║██╔═══╝░██╔═══╝░"
    puts "╚█████╔╝╚██████╔╝██║░░██║   ╚█████╔╝██║░░██║██║░░██║   ██║░░██║██║░░░░░██║░░░░░"
    puts "░╚════╝░░╚═════╝░╚═╝░░╚═╝   ░╚════╝░╚═╝░░╚═╝╚═╝░░╚═╝   ╚═╝░░╚═╝╚═╝░░░░░╚═╝░░░░░"
    puts""
    puts""
    puts "********************************************************************************************" 
    puts ""
    puts "------ At any time, enter 0 to return to the previous menu ------"
    puts ""
    puts ""
  end
    
  # return a string that a user puts
  def get_character_from_user
    puts "  Please enter your name:  "
    name = gets.chomp.to_str
  end

  # creates a new custormer with the user's name
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
    puts " Enter 1 if you are a customer"
    puts " Enter 2 if you are an employee"
    response = gets.chomp.to_i
    puts ""

    case response
    when 0
    first_options
    when 1
      customer
    when 2
      employee
    else
      puts "*** Error, invalid entry! ***"
      first_options
    end 
  end
  

  def employee

    puts "--------------------------------------------------------------------"
    puts "Please select the number corresponding to the dealership you are at"
    puts "--------------------------------------------------------------------"
    puts ""
    d_list = Dealership.dealership_hash.each do |index, dealership|
        puts "#{index}. #{dealership.name} located at #{dealership.location}\n"
      end
    e_dealer_selection = gets.chomp.to_i
    
    e_dealership = Dealership.dealership_hash.find do |index, dealership|  
        e_dealer_selection == index
      end
    e_dealership = e_dealership[1]

# ------------At this point we have------------ # 
    puts ""
    puts " Enter 1 to see all sold cars" 
    puts " Enter 2 to see number of sold cars"
    puts " Enter 3 to see inventory"
    puts " Enter 4 to see the number of cars in our inventory"
    puts " Enter 5 to see the total sale revenue"

    e_response = gets.chomp.to_i
    case e_response
    when 0
      first_options
    when 1
      puts" "
      present_cars(e_dealership.sold_cars) 
      goodbye
    when 2
      puts" "
      puts" There are #{e_dealership.sold_cars.length} sold cars."
      goodbye
    when 3
      puts" "
      present_cars(e_dealership.unsold_cars)
      goodbye
    when 4
      puts" "
      puts" There are #{e_dealership.unsold_cars.length} unsold cars."
      goodbye
    when 5
      puts " The total revenue is $#{e_dealership.total_sale}."
      goodbye
    else
      puts "*** Error, invalid entry! ***"
      employee
    end 
  end


  # def customer 
  #   puts " Enter 1 to search through dealership data" 
  #   puts " Enter 2 to search through all car data"
  #   puts " Enter 3 to purchase a car"
    
  #   customer_response = gets.chomp.to_i
  #   # return 
  #   if customer_response == 1
  #     dealerships_list
  #   elsif customer_response == 2
  #     car_lists
  #   elsif customer_response == 3 
  #     customer_buy_car
  #   elsif customer_response == 0
  #     first_options
  #   else
  #     puts "*** Error, invalid entry! ***"
  #     customer 
  #   end
  # end
    
##----THIS IS MORE ELEGANT THAN ELSIF----##
  def customer
    puts ""
    puts " Enter 1 to search through dealership data" 
    puts " Enter 2 to search through all car data"
    puts " Enter 3 to purchase a car"
    customer_response = gets.chomp.to_i
    case customer_response
    when 0
      first_options
    when 1
      dealerships_list
    when 2
      car_lists
    when 3
      customer_buy_car
    else
      puts "*** Error, invalid entry! ***"
      customer 
    end
  end

  def customer_buy_car 
    puts ""
    puts " Enter the number of the car you wish to purchase"
    Car.cars_available_hash.each do |index, car|
      puts "#{index}.       Make: #{car.make}       Model: #{car.model}       Year: #{car.year}       Price: $#{car.price}\n"
    end
    
    buy_this_car = gets.chomp.to_i  
    bought_car_instance = Car.cars_available_hash.find do |key, car|   
      buy_this_car == key
    end

    bought_car_instance = bought_car_instance[1]
    purchased_car = bought_car_instance.buy_car(@customer)
    purchased_car.update(customer_id: @customer.id)
 
    puts ""
    puts "Congratulations! #{@customer.name} you now own a #{purchased_car.status} #{purchased_car.make}, #{purchased_car.model}!"
    goodbye
  end

  def car_lists
    puts ""
    puts " Enter 1 to see a list of all available cars" 
    puts " Enter 2 to search the cars by make"

    #----THIS IS MORE ELEGANT THAN ELSIF----##
    car_response = gets.chomp.to_i
    case car_response
    when 0
      first_options
    when 1
      cars = Car.all_cars_for_sale
      present_cars(cars)
      goodbye
    when 2
      puts " Enter the make of the car"
      make_response = gets.chomp.to_str.downcase
      cars = Car.search_by_make(make_response)
      present_cars(cars)
      goodbye
    else
      puts "*** Error, invalid entry! ***"
      car_lists 
    end
  end
  # car_response = gets.chomp.to_i

  # if car_response == 1
  #   cars = Car.all_cars_for_sale
  #   present_cars(cars)
  #   goodbye     
  # elsif car_response == 2
  #   puts " Enter the make of the car"
  #   make_response = gets.chomp.to_str.downcase
  #   cars = Car.search_by_make(make_response)
  #   present_cars(cars)
  #   goodbye
  # else
  #   puts "*** Error, invalid entry! ***"
  #   car_lists 
  # end
  
    
  def dealerships_list
    puts ""
    puts " Enter 1 to see a list of all the dealerships" 
    puts " Enter 2 to search the inventory by dealership name" 
    
    ##----THIS IS MORE ELEGANT THAN ELSIF---##
    dealerships_response = gets.chomp.to_i
    case dealerships_response
    when 0
      first_options
    when 1
      present_dealerships(Dealership.all)
      goodbye
    when 2
      puts " Enter the name of the dealership"
      dealership_cars = gets.chomp.to_str.downcase
      cars = Dealership.dealership_spec_car(dealership_cars) 
      present_cars(cars)
      goodbye
    else
      puts "*** Error, invalid entry! ***"
      dealerships_list
    end
    # dealerships_response = gets.chomp.to_i
    # if dealerships_response == 1 
    #   present_dealerships(Dealership.all)
    #   goodbye
  
    # elsif dealerships_response == 2
    #   puts " Enter the name of the dealership"
    #   dealership_cars = gets.chomp.to_str.downcase
    #   cars = Dealership.dealership_spec_car(dealership_cars) 
    #   present_cars(cars)
    #   goodbye
      
    # elsif dealerships_response == 0
    #     first_options   
    # else
    #   puts "*** Error, invalid entry! ***"
    #   dealerships_list
    # end
  end
  
  
  def goodbye
    puts "-------------------------------------------Goodbye--------------------------------------------"
  end

end


# ---------------- Replaced Methods -----------------------------
#  # ---------------------------
  # first_option
  #   if response == 1
  #     customer
  #   elsif response == 2  
  #     employee
  #   elsif response == 0
  #     first_options
  #   else
  #     puts "*** Error, invalid entry! ***"
  #     first_options
  #   end
  # end
  # ----------------------------------

  # -----------------------------------
    #  from  employee
    # e_response = gets.chomp.to_i

    # if e_response == 1
  
    #   present_cars(e_dealership.sold_cars) 

    # elsif e_response == 2
    #   puts" There are #{e_dealership.sold_cars.length} sold cars."
    #   goodbye

    # elsif e_response == 3 
    #   present_cars(e_dealership.unsold_cars)
    #   goodbye
      
    # elsif e_response == 4
    #   puts" There are #{e_dealership.unsold_cars.length} unsold cars."
    #   goodbye
      
    # elsif e_response == 5
    #   puts " The total revenue is #{e_dealership.total_sale}."
    #   goodbye
    # elsif e_response == 0
    #   first_options
    # else
    #   puts "*** Error, invalid entry! ***"
    #   employee
    # end
        ##----THIS IS MORE ELEGANT THAN ELSIF---##

  # --------------------------------------------------------------------------


# welcome
#   - list all cars
    # 1 if customer
    #   1.1 car options
    #       1.1.1 list all cars
    #       1.1.2 search cars by make
          # 1.1.3 search car by status
          # 1.1.4 search car by price
    # 
    #   1.2 dealership options
    #       1.2.1 list of all dealerships
    #       1.2.2 search inventory by dealership
    #           - list cars by make : option to buy car
    #   1.3 buy car
                # sort by make
                # sort by price
                # sort by condition
    
                
    # 2 if employee
    #   1 to see all sold cars
    #   2 to see inventory
    #   3 get number of cars sold
    #   4 get the number of cars unsold
    #   


# As a user I can see the list of all cars
# AS a user I can see all the dealership
# As a user I can search a dealrship by providing the dealerhip name and see all the car lists 
# As a user I can see all the avaliable cars and select the ones I want to buy
# As a user I can buy a car
# As a user I can searh a car by make
# As an employee I can see the list of sold cars
# As an employee I can see all unsold cars
# AS an employee I can get number of cars sold
# As an employee I can get the number of cars unsold








