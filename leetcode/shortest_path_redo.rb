# shortest path between two matrix redo

# Start from top left node
# For every node, explore neighbor
# If neighbor node is destination, set found flag as true
# Return number of steps taken
require 'byebug'

def shortestPath(matrix)

    # R = matrix.length
    # C = matrix[0].length

    starting_row = 0
    starting_column = 0

    $visited = Array.new(matrix.length) {Array.new(matrix[0].length, false)}
    $visited[starting_row][starting_column] = true

    $row_queue = []
    $col_queue = []

    $row_queue << starting_row
    $col_queue << starting_column



    node_in_current_layer = 1
    $node_in_next_layer = 0
    reached_end = false
    $move_count = 0
    
    # debugger
    while $row_queue.length > 0
        cr = $row_queue.shift # current row
        cc = $col_queue.shift # current column

        if matrix[cr][cc] == "d"
            reached_end = true
            break
        end

        explore_neighbors(cr, cc, matrix)
        node_in_current_layer -= 1

        if node_in_current_layer == 0
            node_in_current_layer = $node_in_next_layer
            $node_in_next_layer = 0
            $move_count += 1
        end
        
    end

    if reached_end == true
        return $move_count
    end
    return -1
end

def explore_neighbors(cr, cc, matrix)
    #N, E, S, W => [-1, 0], [0, 1], [1, 0], [0, -1]
    dr = [-1, 0, 1, 0]
    dc = [0, 1, 0, -1]
    # debugger
    i = 0
    while i<4
        next_row = cr + dr[i]
        next_col = cc + dc[i]
        
        i+=1

        # check if out of bounds
        next if next_row < 0 || next_col < 0
        next if next_row >= matrix.length || next_col >= matrix[0].length

        # check if visited
        next if $visited[next_row][next_col] == true

        # check if obtacle
        next if matrix[next_row][next_col] == '*'

        # debugger
        $row_queue << next_row
        $col_queue << next_col
        $visited[next_row][next_col] = true
        $node_in_next_layer += 1
    end

end

input = [['s', '0', '0', '0'],
        ['*', '*', '*', '0'],
        ['0', '0', '0', '0'],
        ['d', '*', '*', '*']]

p shortestPath(input)