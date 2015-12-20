module SolarSystem (solarSystem) where

import System
import Planets
import Data.Time.Clock
import Control.Monad

solarSystem :: IO System
solarSystem = liftM (System [sun, planet1, planet2] 1.0 1.0 ) getCurrentTime
