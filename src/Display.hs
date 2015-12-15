module Display (display, idle) where

import Graphics.UI.GLUT
import Data.IORef
import Control.Monad
import Body
import Cube
import Points

display :: IORef System -> DisplayCallback
display System = do
  clear [ColorBuffer]
  loadIdentity
  (x',y') <- get pos
  translate $ Vector3 x' y' 0
  renderBody $ Body 1 (0, 0) 1.0 (Color3 1 0 1)
  preservingMatrix $ do
    a <- get angle
    rotate a $ Vector3 0 0 1
    scale 0.7 0.7 (0.7::GLfloat)
    forM_ (points 7) $ \(x,y,z) -> preservingMatrix $ do
      color $ Color3 ((x+1)/2) ((y+1)/2) ((z+1)/2)
      translate $ Vector3 x y z
      cube 0.1
  swapBuffers

idle :: IORef GLfloat -> IORef (GLfloat, GLfloat) -> DisplayCallback
idle angle pos = do
  angle $~! (+ 0.1)
  postRedisplay Nothing
