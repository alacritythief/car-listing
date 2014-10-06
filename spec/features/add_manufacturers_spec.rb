require 'rails_helper'

feature 'adding a manufacturer' do
  scenario 'user submits valid manufacturer' do
    visit '/manufacturers/new'

    fill_in "Name", with: "Volkswagen"
    fill_in "Country", with: "Germany"

    click_button "Add Manufacturer"

    expect(page).to have_content("Manufacturer posted.")
    expect(page).to have_content("Volkswagen")
    expect(page).to have_content("Germany")
  end

  scenario 'user submits a blank form' do
    visit '/manufacturers/new'

    click_button "Add Manufacturer"

    expect(page).to have_content("We couldn't post your Manufacturer.")
    expect(page).to have_content("errors")
    expect(page).to have_content("Name can't be blank")
    expect(page).to have_content("Country can't be blank")
  end
end
