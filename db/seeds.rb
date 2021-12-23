# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
mission_2= Mission.create!(title: 'Zeta 14', time_in_space: 45)
mission_3= Mission.create!(title: 'Capricorn 4', time_in_space: 53)
mission_1= Mission.create!(title: 'Apollo 13', time_in_space: 30)

astronaut_1 = Astronaut.create!(name: 'Bob', age: 54, job: 'Navigator')
astronaut_2 = Astronaut.create!(name: 'George', age: 28, job: 'Engineer')
astronaut_3 = Astronaut.create!(name: 'Martha', age: 35, job: 'Engineer')

mission_1.astronauts << astronaut_1
mission_1.astronauts << astronaut_2

mission_2.astronauts << astronaut_3

mission_3.astronauts << astronaut_1
mission_3.astronauts << astronaut_2
mission_3.astronauts << astronaut_3
