# This is a Rails app and we want to load all the files in the app 
# when running this code.  To do so, your current working directory
# should be the top-level directory (i.e. /workspace/your-app/) and then run:
# rails runner labs/2-models.rb

# **************************
# DON'T CHANGE OR MOVE
Salesperson.destroy_all
# **************************

# Lab 2: Models
# - We've added data into the companies table.  Next, we'll add data
#   into the salespeople table.  Follow the steps below to insert and
#   read rows of salesperson data.  Update a row.  Afterwards, display
#   how many rows have been inserted into the salespeople table.
#   Lastly, if you want a challenge, try writing code to display the
#   full name of each salesperson.

# 1a. check out the schema file
# 1b. check out the model file

# 2. insert 1-2 rows in salespeople table.

# 3. write code to display how many salespeople rows are in the database

# ---------------------------------
# Salespeople: 2

# 4. modify/update column data for a row in the salespeople table.

# CHALLENGE:
# 5. write code to display each salesperson's full name

# ---------------------------------
# Salespeople: 2
# Ben Block
# Brian Eng

# schema below:
# create_table "salespeople", force: :cascade do |t|
#     t.string "first_name"
#     t.string "last_name"
#     t.string "email"
#     t.datetime "created_at", null: false
#     t.datetime "updated_at", null: false
#   end

new_salesperson = Salesperson.new
new_salesperson["first_name"] = "Ben"
new_salesperson["last_name"] = "Block"
new_salesperson["email"] = "benny.boi@gmail.com"
new_salesperson.save

new_salesperson = Salesperson.new
new_salesperson["first_name"] = "Brian"
new_salesperson["last_name"] = "Eng"
new_salesperson["email"] = "Big-Engergy@gmail.com"
new_salesperson.save

puts "There are #{Salesperson.all.count} salespeople"

ben = Salesperson.find_by({"first_name" => "Ben", "last_name" => "Block"})
puts ben.inspect

ben["email"] = "bigboiben@gmail.com"
ben.save

# loop is how you do #5 properly:
people = Salesperson.all

for salesperson in people
    first_name = salesperson["first_name"]
    last_name = salesperson["last_name"]
    name = "#{first_name} #{last_name}"
    puts name
end
