# As a user
# When I visit "/"
# And I fill in the search form with 80203 (Note: Use the existing search form)
# And I click "Locate"
# Then I should be on page "/search"
# Then I should see a list of the 10 closest stations within 6 miles sorted by distance
# And the stations should be limited to Electric and Propane
# And for each of the stations I should see Name, Address, Fuel Types, Distance, and Access Times

require 'rails_helper'

feature 'NREL energy' do
  scenario 'User can fill in zip code to find 10 closes stations' do
    user = User.create!(name: 'Will')
    station_1 = Station.create!(name: 'Electric Station', address: 'electric lane', fuel_type: 'electric', distance: 5, access_time: 5)
    station_2 = Station.create!(name: 'Propane Station', address: 'electric lane', fuel_type: 'propane', distance: 5, access_time: 5)
    station_3 = Station.create!(name: 'Gas Station', address: 'electric lane', fuel_type: 'gas', distance: 5, access_time: 5)

    visit '/'

    fill_in zipcode, with: '80203'
    click_on 'Locate'

    expect(current_path).to eq('/search')
    expect(station.count).to eq(10)
    expect(page).to have_content(station_1.name)
    expect(page).to have_content(station_1.address)
    expect(page).to have_content(station_1.fuel_type)
    expect(page).to have_content(station_1.distance)
    expect(page).to have_content(station_1.access_time)
  end
end
