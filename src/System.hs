module System where

import Body
import Data.Time.Clock
import Data.Vector.Class

data System = System {sBodies :: [Body], 
                      sSpeed :: Float, 
                      sGravityAmplifier :: Float,
                      sLastUpdate :: UTCTime} 
                      deriving (Show)

instance Show UTCTime where
  show time = ""

scaleSystem :: Double -> System -> System
scaleSystem factor system = system {sBodies = map (scaleBody factor) $ sBodies system} 

scaleBody :: Double -> Body -> Body
scaleBody factor body = body {
    bRadius = bRadius body * factor,
    bPos = bPos body |* factor,
    bVel = bVel body |* factor,
    bAcc = bAcc body |* factor,
    bMass = bMass body * factor}
