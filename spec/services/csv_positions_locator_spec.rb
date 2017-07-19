require 'rails_helper'

describe CSVPositionsLocator do
  describe '#call' do
    it 'returns points in a file' do
      path = "#{Rails.root}/spec/fixtures/data.csv"
      points = CSVPositionsLocator.new(path: path).call

      expect(points.first).to eq(['48.86451', '2.38295'])
      expect(points.last).to eq(['48.86516', '2.38421'])
    end
  end
end
