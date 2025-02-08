class CreateContacts < ActiveRecord::Migration[7.1]
  def change
    create_table :contacts do |t|
      t.string "first_name"
      t.string "last_name"
      t.string "email"
      t.string "phone_number"
      t.integer "company_id"

      t.timestamps
    end
  end
end

# if we forget a line that we want or messed up our spelling and want to change the table, we cant just tweak
# this file and re-run the file. it can only be run once
# easy way to do it it is delete the development.sqlite3 database then rerun the rails db:migrate

# Other way is to do "rails generate migration AddSomethingToSomething" but not learning tonight