class RentalsController < ApplicationController
  expose :rentals, -> { Rental.all }
end
