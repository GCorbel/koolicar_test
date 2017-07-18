class RentalsController < ApplicationController
  respond_to :html

  expose :rentals, -> { Rental.all }
  expose :rental

  def create
    rental = Rental.create(rental_attributes)
    respond_with(rental, location: rentals_path)
  end

  def update
    rental.update_attributes(rental_attributes)
    respond_with(rental, location: rentals_path)
  end

  def destroy
    rental.destroy
    respond_with(rental)
  end

  private

  def rental_attributes
    params.require(:rental).permit(:title)
  end
end
