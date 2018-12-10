# https://www.geeksforgeeks.org/shortest-distance-two-cells-matrix-grid/

# implement Graph
require 'byebug'
class Vertex
    attr_accessor :value
    attr_reader :in_edges, :out_edges

    def initialize(value)
        @value = value
        @in_edges = []
        @out_edges = []
    end

end

class Edge
    attr_reader :from_vertex, :to_vertex

    def initialize(from_vertex, to_vertex)
        @from_vertex = from_vertex
        @to_vertex = to_vertex

        from_vertex.out_edges << self
        to_vertex.in_edges << self
    end

    def destroy!
        @from_vertex.out_edges.delete(self)
        @to_vertex.in_edges.delete(self)
        @from_vertex = @to_vertex = nil
    end
end

zero = Vertex.new(0)
one = Vertex.new(1)
two = Vertex.new(2)
three = Vertex.new(3)

# zero.out_edges << Edge.new(zero, one)
Edge.new(zero, one)
# zero.in_edges << Edge.new(two, one)
Edge.new(two, zero)
# one.out_edges << Edge.new(one, two)
Edge.new(one, two)
# one.in_edges << Edge.new(zero, one)
Edge.new(zero, two)
# two.out_edges << Edge.new(two, three)
Edge.new(two, three)
# two.in_edges << Edge.new(zero, two)
Edge.new(three, three)
# three.in_edges << Edge.new(two, three)
# three.in_edges << Edge.new(three, three)

