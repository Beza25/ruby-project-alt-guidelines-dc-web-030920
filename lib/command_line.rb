
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
  
  
  
  
  def first_options
  
    puts "Enter 1 to see all the car lists."
    puts "Enter 2 to search dealerships"
    response = gets.chomp.to_i
    puts "#################################"
  
    if response == 1
       Car.all.each_with_index do |car, index|
        puts 
        puts "#{index+1}.       Make: #{car.make}       Model: #{car.model}       Year: #{car.year}       Price: $#{car.price}\n"
       end
    elsif response == 2
      Dealership.all.each_with_index do |dealership, index|
        puts "#{index+1}. #{dealership.name} located at #{dealership.location}\n"
      end
    end
  end
  
  def car_lists
    # Car.all
    # binding.pry
    # puts "cars"
  
  end
  
  def dealership_lists
    puts "dealership"
  
  end
  
  
  # puts " Do you want to see the list of cars a dealership has?"
  
  
  
  

end

