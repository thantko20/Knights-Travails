# Knights Travails

## What's this project about?

Knights Travails is also know as Knight's Tour problem which is given to computer science students. A knight can move any square on a chess board. This program finds the shortest path for a knight to travel from given square to destination square on the board.

![Knight Travails](/Knights-Travails/demo_img/knight_travails_demo.png)

## Data Structures and Algos used

First, I create **Knight** class which will store the given square and its neighbors. The neighbors can be ranged from 2 and 8. Then I create **Board** class to store **Knight** objects for each square on the chess board. Now **Board** class is identical to [graph theory](https://en.wikipedia.org/wiki/Graph_theory).

I handle the edges by creating a hash structure in which each cell will be key and its value is an array of legal moves.

I use [Breadth-First-Search](https://en.wikipedia.org/wiki/Breadth-first_search) to traverse the graph and find the shortest path if I hit the destination. So I backtrack by storing each child's predecessor until I get starting square.

I get this idea from [this awesome lecture](https://www.cs.dartmouth.edu/~scot/cs10/lectures/19/19.html) from Dartmouth.

## What still needs to be done.

1. My program may not visually appealing.(*but hey it ***works***)
2. Some methods do multiple things at once. This is a bad habit of me. Hope I can improve to organize my code in future projects.