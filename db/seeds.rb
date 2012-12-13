# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# if there are no users at all, create one
if User.all.empty?
  User.create! do |u|
    u.email = 'admin@pdmp.example.org'
    u.password = u.password_confirmation = 'admin123'
    puts "admin account bootstrapped: #{u.email}/#{u.password}"
  end
end

# http://ushik.ahrq.gov/dr.ui.drData_Page?System=ps&KeyRID=88721000
if Sex.all.empty?
  Sex.create! code: "F", display_name: "Female", original_text: "Female", code_system: "2.16.840.1.113883.5.1", code_system_name: "AdministrativeGender"
  Sex.create! code: "M", display_name: "Male", original_text: "Male", code_system: "2.16.840.1.113883.5.1", code_system_name: "AdministrativeGender"
  Sex.create! code: "UNK", display_name: "Unknown", original_text: "Unknown", code_system: "2.16.840.1.113883.5.1008", code_system_name: "NullFlavor"
end
