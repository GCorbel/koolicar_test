class RentalsController < ApplicationController
  respond_to :html

  expose :rentals, -> { Rental.all }
  expose :rental

  def create
    rental = Rental.new(rental_attributes)
    rental.distance = compute_distance if rental_attributes[:csv_file]
    rental.save
    respond_with(rental, location: rentals_path)
  end

  def update
    rental.assign_attributes(rental_attributes)
    rental.distance = compute_distance if rental_attributes[:csv_file]
    rental.save
    respond_with(rental, location: rentals_path)
  end

  def destroy
    rental.destroy
    respond_with(rental)
  end

  private

  def rental_attributes
    params.require(:rental).permit(:title, :csv_file)
  end

  def compute_distance
    path = rental_attributes[:csv_file].tempfile.path
    points = CSVPositionsLocator.new(path: path).call
    DistanceCalculator.new(points: points).call
  end
end
