require 'rails_helper'

feature 'adding a car' do
  before :each do
    Manufacturer.create(name: "Bobco", country: "Canada")
  end

  scenario 'user submits valid car' do
    visit '/cars/new'

    find('#car_manufacturer_id').find(:xpath, 'option[1]').select_option

    fill_in "Color", with: "Green"
    fill_in "Year", with: "2005"
    fill_in "Mileage", with: "10000"
    fill_in "Description", with: "Used Bobco car"

    click_button "Add Car"

    expect(page).to have_content("Car listing posted.")
    expect(page).to have_content("Green")
    expect(page).to have_content("2005")
    expect(page).to have_content("10000")
    expect(page).to have_content("Used Bobco car")
  end

  scenario 'user submits empty form' do
    visit '/cars/new'

    click_button "Add Car"

    expect(page).to have_content("Warning: We couldn't list your car.")
    expect(page).to have_content("Color can't be blank")
    expect(page).to have_content("Mileage can't be blank")
    expect(page).to have_content("Year is not a number")
    expect(page).to have_content("Year can't be blank")
  end
end
