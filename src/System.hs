module System where

import Body

data System = System {sBodies :: [Body], 
                      sSpeed :: Float, 
                      sGravityAmplifier :: Float,
                      sLastUpdate :: Double} 

