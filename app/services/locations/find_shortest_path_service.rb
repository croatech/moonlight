class Locations::FindShortestPathService
  def initialize(from_location_id:, to_location_id:)
    @from_location_id = from_location_id
    @to_location_id = to_location_id
    @result = []
  end

  def call
    build_vertices
    build_edges
    graph = DirectedGraph::Graph.new(@edges)
    graph.shortest_path(
      instance_variable_get("@vertice_#{from_location_id}"),
     instance_variable_get("@vertice_#{to_location_id}")
    ).each do |d|
      @result << d.name
    end

    return result
  end

  private

  attr_reader :from_location_id, :to_location_id, :result

  def build_vertices
    locations.find_each do |location|
      instance_variable_set("@vertice_#{location.id}", DirectedGraph::Vertex.new(name: location.id))
    end
  end

  def build_edges
    @edges = []
    locations.find_each do |location|
      location.near_locations.find_each do |near_location|
        instance_variable_set("@edge_#{location.id}_#{near_location.id}", DirectedGraph::Edge.new(
          origin_vertex: instance_variable_get("@vertice_#{location.id}"),
          destination_vertex: instance_variable_get("@vertice_#{near_location.id}")
        ))
        @edges << instance_variable_get("@edge_#{location.id}_#{near_location.id}")
      end
    end
  end

  def locations
    @locations ||= Location.cells.active.includes(:near_locations)
  end
end
