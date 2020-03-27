"""
Game of Life
https://rosettacode.org/wiki/Conway%27s_Game_of_Life#Processing
Processing 3.4
2020-03-26 Alexandre Villares

The Game of Life is a cellular automaton devised by the British
mathematician John Horton Conway in 1970. It is the best-known example
of a cellular automaton.

Task:

Although you should test your implementation on more complex examples
such as the glider in a larger universe, show the action of the blinker
(three adjoining cells in a row all alive), over three generations,
in a 3 by 3 grid.
"""

cell_size = 10
sample = 10 
play = False   # simulation is running

def setup():
    global grid, next_grid, rows, cols
    size(800, 500)
    noStroke()

    rows = height / cell_size
    cols = width / cell_size
    grid = empty_grid()
    next_grid = empty_grid()
    randomize_grid()

    println("Press 'space' to start/stop")
    println("'e' to clear all cells")
    println("'b' demonstrate 'blinker'")
    println("'g' demonstrate glider")
    println("'r' to randomize grid")

def draw():
    background(0)
    for i in range(cols):
        x = i * cell_size
        for j in range(rows):
            y = j * cell_size
            current_state = grid[i][j]
            fill(255)
            if current_state:
                square(x, y, cell_size)
            if play:
                ngbs_alive = calc_ngbs_alive(i, j)
                result = rule(current_state, ngbs_alive)
                next_grid[i][j] = result
                
    if play and frameCount % sample == 0:
        step()

def rule(current, ngbs):
    """ classic Conway's Game of Life rule """
    if ngbs < 2 or ngbs > 3:
        return 0  # dies / dead
    elif ngbs == 3:
        return 1  # born / alive
    else:
        return current  # stays the same (ngbs == 2)

def calc_ngbs_alive(i, j):
    NEIGHBOURS = ((-1, 00), (01, 00),  # a tuple describing the neighbourhood of a cell
                  (-1, -1), (00, -1),
                  (01, -1), (-1, 01),
                  (00, 01), (01, 01))
    alive = 0
    for iv, jv in NEIGHBOURS:
        alive += grid[(i + iv) % cols][(j + jv) % rows]
    return alive

def empty_grid():
    grid = []
    for _ in range(cols):
        grid.append([0] * rows)
    return grid

def randomize_grid():
    from random import choice
    for i in range(cols):
        for j in range(rows):
            grid[i][j] = choice((0, 1))

def step():
    global grid, next_grid
    grid = next_grid
    next_grid = empty_grid()

def keyReleased():
    global grid, play, sample
    if key == "e":
        grid = empty_grid()
    if key == "r":
        randomize_grid()
    if key == "g":
         grid[10][10:13] = [0, 1, 0]       
         grid[11][10:13] = [0, 0, 1]       
         grid[12][10:13] = [1, 1, 1]       
    if key == "b":
         grid[10][10:13] = [0, 1, 0]       
         grid[11][10:13] = [0, 1, 0]       
         grid[12][10:13] = [0, 1, 0]               
    if key == " ":
        play = not play 
    if  str(key) in '+=':
        sample = max(sample - 1, 1);
    if key == '-':
        sample += 1

def mousePressed():
    for i in range(cols):
        x = i * cell_size
        for j in range(rows):
            y = j * cell_size
            current_state = grid[i][j]
            if mouse_over(x, y):
                grid[i][j] = (1, 0)[current_state]

def mouse_over(x, y):
    return x < mouseX < x + cell_size and y < mouseY < y + cell_size
