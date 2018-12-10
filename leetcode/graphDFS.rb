require 'byebug'
# require_relative 'graphImplemented'

class Node
    attr_reader :value
    attr_accessor :adjacent_nodes
    def initialize(value)
        @value = value
        @adjacent_nodes = []
    end

    def add_edge(adjacent_node)
        @adjacent_nodes << adjacent_node
    end

end

class Graph
    attr_accessor :nodes, :testing
    def initialize
        @nodes = {}
    end

    def add_node(node)
       @nodes[node.value] = node
    end

    def add_edge(from_node, to_node)
        # debugger
        @nodes[from_node.value].add_edge(@nodes[to_node.value])
        @nodes[to_node.value].add_edge(@nodes[from_node.value])
    end

    # The function to do DFS traversal. It uses DFSUtil()
    def DFS(node)
        # total vertices
        vertices = self.nodes.length

        # Mark all vertices as not visited
        visited = {}
        @nodes.keys.map {|key| visited[key] = false}

        p visited
        found = false
        DFSUtil(node, visited)
    end

    def DFSUtil(node, visited)
        # Mark current node as visited
        visited[node.value] = true
        p "node.value: #{node.value}"


        # p "visited: #{visited}"

        # Recursive call all the vertices adjacent to this matrix

        # p "Adjacent nodes:"
        # p node.adjacent_nodes.map {|node| node.value}
        node.adjacent_nodes.each do |node|
            if visited[node.value] == false
                DFSUtil(node, visited)
            end
        end

    end


end

zero = Node.new(0)
one = Node.new(1)
two = Node.new(2)
three = Node.new(3)

graph = Graph.new()
graph.add_node(zero)
graph.add_node(one)
graph.add_node(two)
graph.add_node(three)

graph.add_edge(zero, one)
graph.add_edge(zero, two)
graph.add_edge(one, two)
graph.add_edge(two, zero)
graph.add_edge(two, three)
graph.add_edge(three, three)


graph.DFS(two)