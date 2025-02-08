# This is a Rails app and we want to load all the files in the app 
# when running this code.  To do so, your current working directory
# should be the top-level directory (i.e. /workspace/your-app/) and then run:
# rails runner code-along/3-associations.rb

# **************************
# DON'T CHANGE OR MOVE
Contact.destroy_all
# **************************

# - Insert and read contact data for companies in the database

# 1. insert new rows in the contacts table with relationship to a company
puts "Contacts: #{Contact.all.count}"

apple = Company.find_by({"name" => "Apple"})

contact = Contact.new
contact["first_name"] = "Tim"
contact["last_name"] = "Cook"
contact["email"] = "tim@apple.com"
# need some way to connect Tim to Apple or he just is floating around
contact["company_id"] = apple["id"]
# what we did above was to find apple in this code, then we can can use that find
# and assign here in this application code (similar to when working in sql)
contact.save
puts contact.inspect

contact = Contact.new
contact["first_name"] = "Craig"
contact["last_name"] = "Federeghi"
contact["email"] = "craig@apple.com"
contact["company_id"] = apple["id"]
contact.save
puts contact.inspect

amazon = Company.find_by({"name" => "Amazon"})

contact = Contact.new
contact["first_name"] = "Jeff"
contact["last_name"] = "Bezos"
contact["email"] = "jeff@amazon.com"
contact["company_id"] = amazon["id"]
contact.save
puts contact.inspect

puts "Contacts: #{Contact.all.count}"

# 2. How many contacts work at Apple?

apple_contacts = Contact.where({"company_id" => apple["id"]})
puts "Apple peeps: #{apple_contacts.count}"

# 3. What is the full name of each contact who works at Apple?
