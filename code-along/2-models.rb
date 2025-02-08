# This is a Rails app and we want to load all the files in the app 
# when running this code.  To do so, your current working directory
# should be the top-level directory (i.e. /workspace/your-app/) and then run:
# rails runner code-along/2-models.rb

# **************************
# DON'T CHANGE OR MOVE
Company.destroy_all
# **************************

# ^^ code above here is destroying all the data, so its deleting the rows before 
# recreating, just so we can practice and dont end up with duplicated data

# - Insert, read, update, and delete rows in companies table
#   (i.e. full CRUD of company data).

# 1a. check out the schema file
# 1b. check out the model file

# 2. insert new rows in companies table

companies = Company.all.count
puts "There are #{Company.all.count} companies."

new_company = Company.new
new_company["name"] = "Apple"
new_company["city"] = "Cupertino"
new_company["state"] = "CA"
new_company["url"] = "https://apple.com"
new_company.save
# puts new_company.inspect

puts "There are #{Company.all.count} companies."

new_company = Company.new
new_company["name"] = "Amazon"
new_company["city"] = "Seattle"
new_company["state"] = "WA"
new_company.save
# puts new_company.inspect

puts "There are #{Company.all.count} companies."

new_company = Company.new
new_company["name"] = "Google"
new_company["city"] = "Mountainview"
new_company["state"] = "CA"
new_company["url"] = "https://google.com"
new_company.save
# puts new_company.inspect


puts "There are #{Company.all.count} companies."

# 3. query companies table to find all row with California company

cali_companies = Company.where({"state" => "CA"})
puts cali_companies.inspect

puts "California Companies: #{cali_companies.count}"

# 4. query companies table to find single row for Apple

apple = Company.where({"name" => "Apple"})[0]
# using the brackets allows us to pull out the specific first line in array
# if we don't have that [0] array search, it makes our find down below not work
apple = Company.find_by({"name" => "Apple"})

# these two lines of code do the same thing, but only works where
# the thing we are looking for is there (only one company called Apple)
# this is why we usually use the ID to make sure there is no dupe

puts apple.inspect

# 5. read a row's column value

puts apple["url"]

# 6. update a row's column value

amazon = Company.find_by({"name" => "Amazon"})
puts amazon.inspect
amazon["url"] = "https://amazon.com"
amazon.save
puts amazon.inspect

# 7. delete a row

google = Company.find_by({"name" => "Google"})
google.destroy
puts "There are #{Company.all.count} companies."