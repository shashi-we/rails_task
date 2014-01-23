# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# A successful charge is one where: {paid: true, refunded: false}
# An unsuccessful charge is one where: {paid: false, refunded: false}
# A refunded charge is one where: {paid: true, refunded: true}

Customer.delete_all
Charge.delete_all

@customer1 = Customer.create!(first_name: 'Dean' ,last_name: 'Martin', email_address: 'dean.martin@culini.com')
@customer2 = Customer.create!(first_name: 'Buddy' , last_name: 'Rich',  email_address: 'buddy.rich@culini.com')
@customer3 = Customer.create!(first_name: 'Miles' ,  last_name: 'Davis',  email_address: 'miles.davis@culini.com')
@customer4 = Customer.create!(first_name: 'Billie' ,  last_name: 'Holiday', email_address: 'billie.holiday@culini.com')

# 10 Should be successful charges:
5.times do 
  charge = @customer1.charges.create!(paid: true, refunded: false)
end
3.times do 
  charge = @customer2.charges.create!(paid: true, refunded: false)
end
charge = @customer3.charges.create!(paid: true, refunded: false)
charge = @customer4.charges.create!(paid: true, refunded: false)

#5 Should be charges that failed:
3.times do 
  charge = @customer3.charges.create!(paid: false, refunded: false)
end
2.times do 
  charge = @customer4.charges.create!(paid: false, refunded: false)
end

#5 should be disputed:
3.times do 
  charge = @customer1.charges.create!(paid: true, refunded: true)
end
2.times do 
  charge = @customer2.charges.create!(paid: true, refunded: true)
end