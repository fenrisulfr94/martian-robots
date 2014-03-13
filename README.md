martian-robots
==============

This program is for the Red Badger developer coding challenge.  At the moment, only basic functionality is in place.  To run the program, open up a terminal and type:

<pre><code>ghci robots.hs</code></pre>

(Provided you've got GHC installed.)

Specification
============= 

The task was to represent 'robots' on a grid of user-defined dimensions.  The robot has a position, a bearing, and maintains a status (lost or visible).  If the robot 'falls off' the grid - i.e. goes outside the user-defined space - it becomes 'lost', and its last move is added to a list of 'scents'.  If another robot is given the same instruction which caused the last robot to become lost, it simply ignores the instruction and moves on to the next one.

A sample run of the program looks like this:

<pre><code>
Input:

5 3 (grid size)
1 1 E 
RFRFRFRF

3 2 N 
FRRFLLFFRRFLL

0 3 W 
LLFFFLFLFL

Output:

1 1 E 
3 3 N LOST
2 3 S
</code></pre>
