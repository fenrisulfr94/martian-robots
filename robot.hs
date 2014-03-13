{- Martian Robots -}


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
rotateLeft :: Robot -> Robot
rotateLeft ((x, y), b, l)
				| b == N = ((x, y), W, l)  
				| b == S = ((x, y), E, l)
				| b == E = ((x, y), N, l)
				| b == W = ((x, y), S, l)

-- Handle 'R' instructions
rotateRight :: Robot -> Robot
rotateRight ((x, y), b, l) 
				| b == N = ((x, y), E, l)
				| b == S = ((x, y), W, l)
				| b == E = ((x, y), S, l)
				| b == W = ((x, y), N, l)

-- Move robot forward with respect to its bearing
forward :: Robot -> Robot
forward ((x, y), b, l) 
				| b == N = ((x + 1, y), b, l)  
				| b == S = ((x - 1, y), b, l)
				| b == E = ((x, y + 1), b, l)
				| b == W = ((x, y + 1), b, l)

move :: Robot -> Instruction -> Robot
move r instr 
		| instr == L = rotateLeft r
		| instr == R = rotateRight r
		| instr == F = forward r

