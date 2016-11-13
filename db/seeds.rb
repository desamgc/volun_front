# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'database_cleaner'

DatabaseCleaner.clean_with :truncation



puts "Creating entidades"

Organization.create(name: 'Ayuntamiento de Madrid')

puts "Creating voluntarios"
Voluntary.create(name: 'Jose Luis')



puts "Creating usuarios"
pwd = '12345678'
User.create( email: 'administrador@madrid.es', password: pwd, password_confirmation: pwd)
User.create( email: 'voluntario@madrid.es', password: pwd, password_confirmation: pwd, profile_id: '1', profile_type: "Voluntary")
User.create( email: 'entidad@madrid.es', password: pwd, password_confirmation: pwd, profile_id: '1', profile_type: "Organization")
User.create( email: 'iam@madrid.es', password: pwd, password_confirmation: pwd, profile_id: '1', profile_type: "Organization")
