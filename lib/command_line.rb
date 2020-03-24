def welcome
  puts "Welcome to our App" 
  puts "*********************" 
  puts "Please enter a customer name"
end

def get_character_from_user

  # tells the user to get data from the command line
  name = gets.chomp.to_str

  # use gets to capture the user's input. This method should return that input, downcased.
end

# save the customer
def save_customer
    get_character_from_user
    binding.pry
   customer = Customer.new(get_character_from_user)
  
end


def first_options

puts "Enter 1 to see all the car lists."

number = gets.chomp

end


# puts " Do you want to see the list of cars a dealership has?"



