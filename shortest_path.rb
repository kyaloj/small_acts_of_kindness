require 'rgl/adjacency'
require 'rgl/dot'
require 'rgl/traversal'
require 'rgl/dijkstra'

def shortest_path
  graph = RGL::DirectedAdjacencyGraph.new

  graph.add_vertices 'Mombasa', 'Kitui', 'Kajiando', 'Nairobi'

  edge_weights = {
    ['Mombasa', 'Kitui'] => 2000,
    ['Mombasa', 'Kajiando'] => 1800,
    ['Kitui', 'Nairobi'] => 4500,
    ['Kajiando', 'Nairobi'] => 4000
  }

  edge_weights.each { |(city1, city2), _w| graph.add_edge(city1, city2) }

  # graph.print_dotted_on

  # p graph.bfs_iterator.to_a
  # p graph.dfs_iterator.to_a

  graph.dijkstra_shortest_path(edge_weights, 'Mombasa', 'Nairobi')
end

p shortest_path
