Customer.destroy_all
Car.destroy_all
Dealership.destroy_all


mike = Customer.create(name: "Mike")
danny = Customer.create(name: "Danny")
beza = Customer.create(name: "Beza")

d1 = Dealership.create(name: "D1", location: "DC")
d2 = Dealership.create(name: "D2", location: "MD")
d3 = Dealership.create(name: "D3", location: "VA")

honda = Car.create(make: "Honda", year: "2017", price: 10000, status: "old", dealership_id: d3.id)
tesla = Car.create(make: "Tesla", year: "2020", price: 50000, status: "new", customer_id: beza.id, dealership_id: d2.id)
ferrari = Car.create(make: "Ferrari", year: "1987", price: 200000, status: "old", customer_id: mike.id, dealership_id: d3.id)

