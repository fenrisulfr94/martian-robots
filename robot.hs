{- Martian Robots -}

import Data.List
------------------- Robot Definition -----------------
------------------------------------------------------

-- x and y co-ordinate of a robot
type Position = (Integer, Integer)

-- Direction a robot is facing
data Bearing = N -- North
		| S  -- South
		| E  -- East
		| W  -- West
		deriving (Eq, Show)

-- Different kinds of instructions a robot can perform
data Instruction = L  -- Left
			| R  -- Right
			| F  -- Forward
			deriving (Eq, Show)

-- A robot is lost if it moves off the grid size 
-- defined by the user.
data Status = Visible | Lost deriving (Eq, Show)

-- A robot has a position, direction, and must know
-- whether or not it is lost.
type Robot = (Position, Bearing, Status)

type Scent = [(Position, Bearing)]

------------------- Robot Operations -----------------
------------------------------------------------------

-- Handle 'L' instructions
-- Rotate robot counter-clockwise with respect to 
-- its bearing
left :: Robot -> Robot
left ((x, y), b, l) =
	case b of
		N -> ((x, y), W, l)
		S -> ((x, y), E, l)
		E -> ((x, y), N, l)
		W -> ((x, y), S, l)

-- Handle 'R' instructions
-- Rotate robot clockwise with respect to its bearing
right :: Robot -> Robot
right ((x, y), b, l) =
	case b of
		N -> ((x, y), E, l)
		S -> ((x, y), W, l)
		E -> ((x, y), S, l)
		W -> ((x, y), N, l)

-- Move robot forward with respect to its bearing
forward :: Robot -> Robot
forward ((x, y), b, l) = 
	case b of
		N -> ((x, y + 1), b, l)  
		S -> ((x, y - 1), b, l)
		E -> ((x + 1, y), b, l)
		W -> ((x - 1, y), b, l)

move :: Robot -> Instruction -> Robot
move r instr =
	case instr of
		L -> left 		r
		R -> right 		r
		F -> forward 	r

-- Fold 'move' over a single robot and its input
exec :: Robot -> [Instruction] -> Robot
exec r is = foldl move r is 

