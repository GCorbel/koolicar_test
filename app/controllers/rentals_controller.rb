class RentalsController < ApplicationController
  respond_to :html

  expose :rentals, -> { Rental.all }
  expose :rental

  def create
    rental.save
    respond_with(rental, location: rentals_path)
  end

  def update
    rental.update_attributes(rentals_attributes)
    respond_with(rental, location: rentals_path)
  end

  def destroy
    rental.destroy
    respond_with(rental)
  end

  private

  def rentals_attributes
    params.require(:rental).permit(:title)
  end
end
