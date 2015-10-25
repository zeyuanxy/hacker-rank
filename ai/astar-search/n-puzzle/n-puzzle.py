import copy   

def main():
    directions = [[-1, 0, 'UP'], [0, -1, 'LEFT'], [0, 1, 'RIGHT'], [1, 0, 'DOWN']]

    n = int(input())
    input_grid = []
    for i in range(n * n):
        x = int(input())
        input_grid.append(x)

    queue = []
    answer_routes = None
    mem = set()

    queue.append([input_grid, [], 1000])
    while len(queue) > 0:
        grid, routes, score = queue.pop(0)
        if score == 0:
            answer_routes = routes
            break

        x, y = 0, 0
        for i in range(n * n):
            if grid[i] == 0:
                x, y = i / n, i % n

        possible_moves = []
        for direction in directions:
            next_x, next_y = x + direction[0], y + direction[1]
            if next_x < 0 or next_x >= n or next_y < 0 or next_y >= n:
                continue
            new_grid = copy.deepcopy(grid)
            new_grid[x * n + y] = grid[next_x * n + next_y]
            new_grid[next_x * n + next_y] = 0
            hashed_new_grid = ''.join(str(x) for x in new_grid)
            if hashed_new_grid in mem:
                continue
            mem.add(hashed_new_grid)
    
            new_score = 0
            for i in range(n * n):
                new_score += abs(new_grid[i] - i)
            new_routes = copy.deepcopy(routes)
            new_routes.append(direction[2])
            queue.append([new_grid, new_routes, new_score])
            
        queue.sort(key = lambda x: x[2])

    print len(answer_routes)
    for direction in answer_routes:
        print direction

if __name__ == "__main__":
    main()