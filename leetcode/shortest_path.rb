#  https://www.geeksforgeeks.org/shortest-distance-two-cells-matrix-grid/

# Shortest distance between two cells in a matrix or grid

# Given a matrix of N*M order. Find the shortest distance from a source cell to a destination cell, traversing through limited cells only. Also you can move only up, down, left and right. If found output the distance else -1.
# s represents ‘source’
# d represents ‘destination’
# * represents cell you can travel
# 0 represents cell you can not travel
# This problem is meant for single source and destination.

# Input : {'0', '*', '0', 's'},
#         {'*', '0', '*', '*'},
#         {'0', '*', '*', '*'},
#         {'d', '*', '*', '*'}
# Output : 6

# Input :  {'0', '*', '0', 's'},
#          {'*', '0', '*', '*'},
#          {'0', '*', '*', '*'},
#          {'d', '0', '0', '0'}
# Output :  -1

require 'byebug'

def shortest_path(matrix)
    $sr = 0 # starting row
    $sc = 0 # starting column
    $rq = [] # row queue
    $cq = [] # column queue

    $R = matrix.length
    $C = matrix[0].length

    # North, south, east, west direction vectors [-1,0], [0, 1], [1, 0], [0, -1]
    $dr = [-1, +1, 0, 0]
    $dc = [0, 0, +1, -1]

    # R x C matrix of false values used to track whether the node at position (i,j) has been visited
    $visited = Array.new($R) {Array.new($C, false)}

    $nodes_in_next_layer = 0

    # Variables used to track the number of steps taken
    move_count = 0
    nodes_left_in_layer = 1

    # Variables used to track whether 'd' character is ever reached during the BFS
    reached_end = false

    $rq << $sr
    $cq << $sc
    $visited[$sr][$sc] = true

    while $rq.length > 0
        r = $rq.shift
        c = $cq.shift

        if matrix[r][c] == 'd'
            reached_end = true
            break
        end

        explore_neighbors(r, c, matrix)
        nodes_left_in_layer -= 1

        if nodes_left_in_layer == 0
            nodes_left_in_layer = $nodes_in_next_layer
            $nodes_in_next_layer = 0
            move_count += 1
        end
    end

    if reached_end
        return move_count
    end
    return -1
end

def explore_neighbors(r, c, matrix)
    i=0
    while i < 4
        rr = r + $dr[i]
        cc = c + $dc[i]
        i+=1
        #Skip out of bounds location
        next if rr < 0 || cc < 0
        next if rr >= $R || cc >= $C

        # Skip visited or blocked cells
        next if $visited[rr][cc] == true
        next if matrix[rr][cc] == '*'

        $rq << rr
        $cq << cc
        $visited[rr][cc] = true
        $nodes_in_next_layer += 1
    end
end

input = [['s', '0', '0', '0'],
        ['0', '*', '*', '0'],
        ['0', '0', '0', '0'],
        ['d', '*', '*', '*']]

p shortest_path(input)