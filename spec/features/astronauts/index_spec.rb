require 'rails_helper'

RSpec.describe 'Astronauts index page' do

  before(:each) do
    @astronaut_1 = Astronaut.create!(name: 'Bob', age: 54, job: 'Navigator')
    @astronaut_2 = Astronaut.create!(name: 'George', age: 28, job: 'Engineer')
    @astronaut_3 = Astronaut.create!(name: 'Martha', age: 35, job: 'Engineer')
    visit '/astronauts'
  end

  it 'dispalys a list of astronauts and their attributes' do
    expect(page).to have_content(@astronaut_1.name)
    expect(page).to have_content(@astronaut_1.age)
    expect(page).to have_content(@astronaut_1.job)

    expect(page).to have_content(@astronaut_2.name)
    expect(page).to have_content(@astronaut_2.age)
    expect(page).to have_content(@astronaut_2.job)

    expect(page).to have_content(@astronaut_3.name)
    expect(page).to have_content(@astronaut_3.age)
    expect(page).to have_content(@astronaut_3.job)
  end
end
