require 'rails_helper'

feature 'Rental' do
  scenario 'List rentals' do
    create(:rental, title: 'Rental')

    visit rentals_path

    expect(page).to have_content('Rental')
  end
end
