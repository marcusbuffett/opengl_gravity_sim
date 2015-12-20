module Display (display, idle) where

import Graphics.UI.GLUT
import Data.IORef
import Control.Monad
import Body
import System
import Renderer
import Data.Vector.V3
import Data.Vector.Class
import Simulation
import Debug.Trace
import Data.Time.Clock

display :: IORef System -> DisplayCallback
display systemRef = do
  clear [ColorBuffer, DepthBuffer]
  time <- getCurrentTime
  modifyIORef systemRef (\sys -> simulate sys time)
  loadIdentity
  depthFunc $= Just Less
  readIORef systemRef >>= renderSystem 
  swapBuffers

idle :: DisplayCallback
idle = postRedisplay Nothing
