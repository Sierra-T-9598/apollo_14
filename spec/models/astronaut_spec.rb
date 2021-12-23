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
end
