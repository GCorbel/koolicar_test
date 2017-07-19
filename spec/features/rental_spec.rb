require 'rails_helper'

feature 'Rental' do
  around do |example|
    VCR.use_cassette('rental') do
      example.run
    end
  end

  scenario 'List rentals' do
    create(:rental, title: 'Rental')

    visit rentals_path

    expect(page).to have_content('Rental')
  end

  scenario 'Create a new rental' do
    visit new_rental_path

    fill_in('Title', with: 'Rental')
    attach_file 'rental_csv_file', "#{Rails.root}/spec/fixtures/data.csv"
    click_on 'Submit'

    expect(page).to have_content('Your Rental has been created')
    expect(page).to have_content('Rental')
    expect(page).to have_content('2 267 467 meters')
  end

  scenario 'Edit a rental' do
    rental = create(:rental, title: 'Rental')

    visit edit_rental_path(rental)

    fill_in 'Title', with: 'Rental 1'
    click_on 'Submit'

    expect(page).to have_content('Your Rental has been updated')
    expect(page).to have_content('Rental 1')
  end

  scenario 'Destroy a rental' do
    create(:rental, title: 'Rental 1')

    visit rentals_path

    click_on 'Delete'

    expect(page).to have_content('Your Rental has been destroyed')
    expect(page).to_not have_content('Rental 1')
  end
end
