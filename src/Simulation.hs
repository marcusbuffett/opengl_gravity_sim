module Simulation (simulate) where

import Body
import System
import qualified Data.Vector.V3 as V
import Data.Vector.Class
import Debug.Trace
import Data.Time.Clock

simulate :: System -> UTCTime -> System
simulate system time = do
  let bodiesUpdatedPos = map (uncurry $ updatePosition (realToFrac deltaT)) (splitBodies (sBodies system))
  let bodiesUpdatedVel = map (uncurry $ updateVelocity (realToFrac deltaT)) (splitBodies bodiesUpdatedPos)
  let finalBodies      = map (updateRotation (realToFrac deltaT)) bodiesUpdatedVel
  system {sBodies = finalBodies, sLastUpdate = addUTCTime deltaT (sLastUpdate system)}
  where
    splitBodies bs = map 
               (split bs)
               [0..length (sBodies system) - 1]
    split xs n = (xs !! n, take n xs ++ drop (n+1) xs)
    deltaT = abs $ diffUTCTime (sLastUpdate system) time

updateRotation :: Double -> Body -> Body
updateRotation dt body = body {bRot = bRot body + bRotSpeed body * dt}

updateVelocity :: Double -> Body -> [Body] -> Body
updateVelocity dt body others = do
  let forces = foldl (\f other -> f + force body other) (vpromote 0) others
  let oldAcc = bAcc body
  let acc    = forces |/ bMass body
  body {bVel = bVel body + vpromote dt * (oldAcc + acc) |/ 2, bAcc = acc}

updatePosition :: Double -> Body -> [Body] -> Body
updatePosition dt body others = body {bPos = newPos}
  where
    newPos = bPos body + vpromote dt * (bVel body + vpromote dt * bAcc body |/ 2)

force :: Body -> Body -> V.Vector3
force body other = vnormalise distances |* scalarForce |* gConstant-- vmap (* gConstant) $ (bMass body * bMass other) *| vzip (*) signs (vmap ((1/) . (^2)) distances)
  where
    scalarForce = bMass body * bMass other / vmag distances ^ 2
    distances = bodyDistance other body

bodyDistance :: Body -> Body -> V.Vector3
bodyDistance body other = bPos body - bPos other

absDistance :: V.Vector3 -> Double
absDistance p = sqrt . vfold (+) $ vmap (^2) p

gConstant = 6.674e-11
