module Bindings (idle, display, reshape) where

import Graphics.UI.GLUT
import Data.IORef
import Display
 
reshape :: ReshapeCallback
reshape size = viewport $= (Position 0 0, size)
