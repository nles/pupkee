# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user = User.new()
service = Service.new();
contact = Contact.new();
customer = Customer.new();
task1 = Task.new();
task2 = Task.new();
task3 = Task.new();
documentation = Documentation.new();

user.name = "dev"
user.email = "dev@dev.com"
user.password = "development"
user.save!

service.name = "Test service"
service.save!

customer.name = "Test customer"
customer.services << service
customer.save!

task1.title= "Undone test task"
task1.customer = customer
task1.save!

task2.title= "Important undone test task"
task2.flag = 1
task2.customer = customer
task2.save!

task3.title= "Done test task"
task3.done = true
task3.customer = customer
task3.save!

contact.date = Date.today
contact.details = "Test contact"
contact.customer = customer
contact.tasks << task1
contact.save!

documentation.title = "Test documentation"
documentation.save!
