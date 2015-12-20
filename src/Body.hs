module Body (Body (..)) where

import qualified Graphics.UI.GLUT as G
import Data.Vector.V3 as V

data Body = Body {bRadius   :: Double,
                  bPos      :: V.Vector3,
                  bVel      :: V.Vector3,
                  bAcc      :: V.Vector3,
                  bRot      :: Double,
                  bRotAngle :: V.Vector3,
                  bRotSpeed :: Double,
                  bMass     :: Double,
                  bColor    :: G.Color3 G.GLfloat }
                  deriving (Show, Eq)

