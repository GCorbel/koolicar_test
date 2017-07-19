require 'csv'

class CSVPositionsLocator
  attr_accessor :path

  def initialize(path:)
    @path = path
  end

  def call
    CSV.read(path, col_sep: ';').map do |row|
      [row[1], row[2]]
    end
  end
end
