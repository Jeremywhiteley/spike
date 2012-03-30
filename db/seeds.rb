# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
`mongoimport -d #{Mongoid.master.name} -h #{Mongoid.master.connection.host_to_try[0]} --drop -c records test/fixtures/records.json`
`mongoimport -d #{Mongoid.master.name} -h #{Mongoid.master.connection.host_to_try[0]} --drop -c clients test/fixtures/clients.json`
`mongoimport -d #{Mongoid.master.name} -h #{Mongoid.master.connection.host_to_try[0]} --drop -c users test/fixtures/users.json`
`mongoimport -d #{Mongoid.master.name} -h #{Mongoid.master.connection.host_to_try[0]} --drop -c ref_consult_requests test/fixtures/ref_consult_requests.json`
`mongoimport -d #{Mongoid.master.name} -h #{Mongoid.master.connection.host_to_try[0]} --drop -c ref_numbers test/fixtures/ref_numbers.json`
