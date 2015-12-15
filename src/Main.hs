import Graphics.UI.GLUT
import Display
import Data.IORef
import Bindings


myPoints :: [(GLfloat,GLfloat,GLfloat)]
myPoints = [ (sin (2*pi*k/24), cos (2*pi*k/24), 0) | k <- [1..24] ]
 
main :: IO ()
main = do
  (_progName, _args) <- getArgsAndInitialize
  initialDisplayMode $= [DoubleBuffered]
  _window <- createWindow "Hello World"
  reshapeCallback $= Just reshape
  angle <- newIORef 0
  delta <- newIORef 0.1
  pos <- newIORef (0, 0)
  keyboardMouseCallback $= Just (keyboardMouse delta pos)
  idleCallback $= Just (idle angle pos)
  displayCallback $= display angle pos
  mainLoop
