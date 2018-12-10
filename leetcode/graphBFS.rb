# BFS with Queue
require_relative 'graphImplemented'

zero = Vertex.new(0)
one = Vertex.new(1)
two = Vertex.new(2)
three = Vertex.new(3)

Edge.new(zero, one)
Edge.new(two, zero)
Edge.new(one, two)
Edge.new(zero, two)
Edge.new(two, three)
Edge.new(three, three)

def graphBFS(node)
    queue = []

    visited = {}

    traversed = []

    queue << node

    while queue.length > 0
        currentNode = queue.shift
        visited[currentNode] = true
        traversed << currentNode.value

        currentNode.out_edges.each do |out_edge|
            # debugger
            if visited[out_edge.to_vertex] != true
                visited[out_edge.to_vertex] = true 
                queue << out_edge.to_vertex
            end
        end

    end
    traversed
end

p graphBFS(two)