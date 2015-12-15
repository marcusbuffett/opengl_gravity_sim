module Renderer where

import Simulation
import System
import Body

import Graphics.UI.GLUT

renderBody :: Body -> IO ()
renderBody body = do
  color $ bColor body
  renderObject Wireframe (Sphere' (bRadius body) 20 10)
