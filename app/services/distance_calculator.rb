class DistanceCalculator
  attr_accessor :points

  def initialize(points:)
    @points = points
  end

  def call
    directions.first[:legs].map { |leg| leg[:distance][:value] }.sum
  end

  private

  def directions
    @directions ||= client.directions(points.first, points.last, gmap_options)
  end

  def client
    @client ||= GoogleMapsService::Client.new
  end

  def gmap_options
    { mode: 'driving', units: 'kilometers', waypoints: waypoints }
  end

  def waypoints
    points[1..-2]
  end
end
