class Rental < ApplicationRecord
  validates :title, presence: true

  attr_accessor :csv_file
end
