require 'rails_helper'

describe Mission, type: :model do
  describe 'Validations' do
    it { should validate_presence_of :title }
    it { should validate_presence_of :time_in_space }
  end

  describe 'Relationships' do
    it { should have_many :astronaut_missions}
    it { should have_many(:astronauts).through(:astronaut_missions)}
  end

  describe 'class methods' do
    describe '::missions_asc' do
      it 'orders missions alphabetically' do
        mission_2= Mission.create!(title: 'Zeta 14', time_in_space: 45)
        mission_3= Mission.create!(title: 'Capricorn 4', time_in_space: 53)
        mission_1= Mission.create!(title: 'Apollo 13', time_in_space: 30)

        expect(Mission.missions_asc).to eq([mission_1, mission_3, mission_2])
      end
    end
  end
end
