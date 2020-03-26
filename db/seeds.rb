
Customer.destroy_all
Car.destroy_all
Dealership.destroy_all


mike = Customer.create(name: "Mike")
danny = Customer.create(name: "Danny")
beza = Customer.create(name: "Beza")
bob = Customer.create(name: "Bob")

d1 = Dealership.create(name: "D1", location: "DC")
d2 = Dealership.create(name: "D2", location: "MD")
d3 = Dealership.create(name: "D3", location: "VA")

honda2 = Car.create(make: "Honda", model: "Accord", year: 2017, price: 10000, status: "used", dealership_id: d1
.id)
tesla1 = Car.create(make: "Tesla", model: "X", year: 2020, price: 50000, status: "new",  dealership_id: d2.id)
tesla2= Car.create(make: "Tesla", model: "X", year: 2020, price: 50000, status: "new",  dealership_id: d2.id)

tesla3 = Car.create(make: "Tesla", model: "3", year: 2020, price: 50000, status: "new", dealership_id: d2.id)
tesla = Car.create(make: "Tesla", model: "S", year: 2020, price: 50000, status: "new", dealership_id: d3.id)
ferrari = Car.create(make: "Ferrari",  model: "Testarrosa", year: 1987, price: 200000, status: "used",  dealership_id: d3.id)
honda = Car.create(make: "Honda", model: "Accord", year: 2013, price: 200000, status: "Used",  dealership_id: d2.id)
lexus = Car.create(make: "Lexus", model: "LS 400", year: 1993, price: 7000, status: "Used", dealership_id: d1.id)
binding.pry
