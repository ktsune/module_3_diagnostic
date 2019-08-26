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

    visit '/'

    fill_in 'zipcode', with: '80203'
    click_on 'Locate'

    expect(current_path).to eq('/search')
    within(".stations") do
      expect(stations.count).to eq(10)
      expect(page).to have_content(station.name)
      expect(page).to have_content(station.address)
      expect(page).to have_content(station.fuel_type)
      expect(page).to have_content(station.distance)
      expect(page).to have_content(station.access_times)
    end
  end
end
