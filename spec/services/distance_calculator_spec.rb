require 'rails_helper'

describe DistanceCalculator do
  around do |example|
    VCR.use_cassette('rental') do
      example.run
    end
  end

  describe 'call' do
    it 'gives the distance between two GPS points' do
      points = [[48.86451, 2.38295], [48.86311, 2.38647], [48.86451, 2.404]]
      distance = DistanceCalculator.new(points: points).call
      expect(distance).to eq 2808
    end
  end
end
