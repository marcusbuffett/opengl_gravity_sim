module Util where

import Graphics.UI.GLUT as G
import Data.Vector.V3 as V

vectorToVertex :: V.Vector3 -> Vertex3 GLfloat
vectorToVertex (V.Vector3 a b c) = Vertex3 (realToFrac a) (realToFrac b) (realToFrac c)

vectorToGLVector :: Fractional a => V.Vector3 -> G.Vector3 a
vectorToGLVector (V.Vector3 a b c) = G.Vector3 (realToFrac a) (realToFrac b) (realToFrac c)
