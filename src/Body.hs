module Body where

import Graphics.UI.GLUT
import Graphics.UI.GLUT.Objects

data Body = Body {bRadius :: Double, 
                  bPos :: (Double, Double), 
                  bVel :: Double,
                  bDensity :: Double,
                  bColor :: Color3 Double}
                  deriving (Show, Eq)

