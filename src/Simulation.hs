module Simulation (simulate) where

import Body
import System
import Vector

simulate :: System -> System
simulate system = do
  let bodies = map 
               (uncurry updateBody . split (sBodies system))
               [1..length (sBodies system) - 1]
  system {sBodies = bodies}
  where
    split xs n = (xs !! n, take (n-1) xs ++ drop n xs)


updateBody :: Body -> [Body] -> Body
updateBody body others = undefined
  {- let forces = foldl (\f other -> f + ) -}
  {- where -}

force :: Body -> Body -> Vector Double
force body other = undefined

bodyDistance :: Body -> Body -> Vector Double
bodyDistance body other = undefined

absDistance :: Vector Double -> Double
absDistance = undefined

mass :: Body -> Double
mass body = (bRadius body)^3 * (4/3) * pi * (bDensity body)


