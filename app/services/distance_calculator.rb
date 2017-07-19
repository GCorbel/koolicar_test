class DistanceCalculator
  attr_accessor :points

  def initialize(points:)
    @points = points.compact
  end

  def call
    points.in_groups_of(25).map { |group| compute_distance(group) }.sum
  end

  private

  def compute_distance(group)
    group = group.compact
    origin = group.first
    destination = group.last
    dir = directions(origin, destination, group[1..-2])
    dir.first[:legs].map { |leg| leg[:distance][:value] }.sum
  end

  def directions(origin, destination, waypoints)
    options = gmap_options.merge(waypoints: waypoints)
    client.directions(origin, destination, options)
  end

  def client
    @client ||= GoogleMapsService::Client.new
  end

  def gmap_options
    { mode: 'driving', units: 'kilometers' }
  end
end
