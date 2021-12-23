require 'rails_helper'

RSpec.describe 'Astronauts index page' do

  before(:each) do
    @mission_2= Mission.create!(title: 'Zeta 14', time_in_space: 45)
    @mission_3= Mission.create!(title: 'Capricorn 4', time_in_space: 53)
    @mission_1= Mission.create!(title: 'Apollo 13', time_in_space: 30)

    @astronaut_1 = Astronaut.create!(name: 'Bob', age: 54, job: 'Navigator')
    @astronaut_2 = Astronaut.create!(name: 'George', age: 28, job: 'Engineer')
    @astronaut_3 = Astronaut.create!(name: 'Martha', age: 35, job: 'Engineer')

    @mission_1.astronauts << @astronaut_1
    @mission_1.astronauts << @astronaut_2

    @mission_2.astronauts << @astronaut_3

    @mission_3.astronauts << @astronaut_1
    @mission_3.astronauts << @astronaut_2
    @mission_3.astronauts << @astronaut_3
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

  it 'displays the average age of all astronauts' do
    expect(page).to have_content("Average age of the astronauts: #{Astronaut.average_age}")
  end

  it 'lists the space missions in alphabetical order for each astronaut' do
    save_and_open_page
    within("#missions-#{@astronaut_1.id}") do
      expect(@mission_1.title).to appear_before(@mission_3.title)
      # expect(page).to_not have_content(@mission_2.title)
    end

    within("#missions-#{@astronaut_2.id}") do
      expect(@mission_1.title).to appear_before(@mission_3.title)
      # expect(page).to_not have_content(@mission_2.title)
    end

    within("#missions-#{@astronaut_3.id}") do
      expect(@mission_3.title).to appear_before(@mission_2.title)
      # expect(page).to_not have_content(@mission_1.title)
    end
  end
end
