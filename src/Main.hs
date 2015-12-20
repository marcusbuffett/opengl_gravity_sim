import Graphics.UI.GLUT
import Display
import Data.IORef
import System
import Bindings
import Body
import Data.Vector.Class
import Data.Time.Clock
import Data.Vector.V3 as V
import SolarSystem

main :: IO ()
main = do
  (_progName, _args) <- getArgsAndInitialize
  initialDisplayMode $= [WithDepthBuffer, DoubleBuffered]
  _window <- createWindow "Universe"
  reshapeCallback $= Just reshape
  time <- getCurrentTime
  systemRef <- solarSystem >>= newIORef
  idleCallback $= Just idle
  displayCallback $= display systemRef
  mainLoop
