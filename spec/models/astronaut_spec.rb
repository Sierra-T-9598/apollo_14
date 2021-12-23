require 'rails_helper'

describe Astronaut, type: :model do
  describe 'Validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :age }
    it { should validate_presence_of :job }
  end

  describe 'Relationships' do
    it { should have_many :astronaut_missions}
    it { should have_many(:missions).through(:astronaut_missions)}
  end

  describe 'class methods' do
    describe '::average_age' do
      it 'calculates the average age of all astronauts' do
        astronaut_1 = Astronaut.create!(name: 'Bob', age: 54, job: 'Navigator')
        astronaut_2 = Astronaut.create!(name: 'George', age: 28, job: 'Engineer')
        astronaut_3 = Astronaut.create!(name: 'Martha', age: 35, job: 'Engineer')

        expect(Astronaut.average_age).to eq(39)
      end
    end
  end

  describe 'instance methods' do
    describe '#all_missions_asc' do
      it 'lists all of an astronauts missions alphabetically' do
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

        expect(astronaut_1.all_missions_asc).to eq([mission_1.title, mission_3.title])
        expect(astronaut_2.all_missions_asc).to eq([mission_1.title, mission_3.title])
        expect(astronaut_3.all_missions_asc).to eq([mission_3.title, mission_2.title])
      end
    end
  end
end
