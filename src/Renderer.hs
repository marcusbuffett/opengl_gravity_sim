module Renderer where

import Simulation
import System
import Body
import Debug.Trace
import Util
import Graphics.UI.GLUT as G
import qualified Data.Vector.V3 as V
import System.Random
import Control.Monad


renderBody :: Body -> IO ()
renderBody body = do
  color $ bColor body
  preservingMatrix $ do 
    translate (vectorToGLVector $ bPos body :: G.Vector3 GLfloat)
    rotate (realToFrac $ bRot body) (vectorToGLVector $ bRotAngle body :: G.Vector3 GLfloat)
    translate (vectorToGLVector . negate $ bPos body :: G.Vector3 GLfloat)
    renderPrimitive Triangles $ 
      forM_ (octahedron (bPos body) (bRadius body)) vertex
    color $ G.Color3 0 0 (0 :: GLfloat)
    renderPrimitive Lines $
      forM_ (octahedronLines (bPos body) (bRadius body)) vertex

renderSystem :: System -> IO ()
renderSystem system = mapM_ renderBody (sBodies system)

octahedron :: V.Vector3 -> Double -> [Vertex3 GLfloat] 
octahedron pos s = map (vectorToVertex . (+ pos))
                               [V.Vector3 w    0 0, V.Vector3 0 w    0, V.Vector3 0 0 w     ,
                                V.Vector3 w    0 0, V.Vector3 0 w    0, V.Vector3 0 0 (-w)  ,
                                V.Vector3 w    0 0, V.Vector3 0 (-w) 0, V.Vector3 0 0 w     ,
                                V.Vector3 w    0 0, V.Vector3 0 (-w) 0, V.Vector3 0 0 (-w)  ,
                                V.Vector3 (-w) 0 0, V.Vector3 0 w    0, V.Vector3 0 0 w     ,
                                V.Vector3 (-w) 0 0, V.Vector3 0 w    0, V.Vector3 0 0 (-w)  ,
                                V.Vector3 (-w) 0 0, V.Vector3 0 (-w) 0, V.Vector3 0 0 w     ,
                                V.Vector3 (-w) 0 0, V.Vector3 0 (-w) 0, V.Vector3 0 0 (-w)]
                    where
                      w = realToFrac s

octahedronLines :: V.Vector3 -> Double -> [Vertex3 GLfloat] 
octahedronLines pos s = map (vectorToVertex . (+ pos))
                               [V.Vector3 w    0  0 , V.Vector3 0 w    0 ,
                                V.Vector3 w    0  0 , V.Vector3 0 (-w) 0 ,
                                V.Vector3 w    0  0 , V.Vector3 0      0 w       ,
                                V.Vector3 w    0  0 , V.Vector3 0      0 (-w)    ,
                                V.Vector3 (-w) 0  0 , V.Vector3 0 w    0 ,
                                V.Vector3 (-w) 0  0 , V.Vector3 0 (-w) 0 ,
                                V.Vector3 (-w) 0  0 , V.Vector3 0      0 w       ,
                                V.Vector3 (-w) 0  0 , V.Vector3 0      0 (-w),
                                V.Vector3 0 w  0 , V.Vector3 0 0    w ,
                                V.Vector3 0 w  0 , V.Vector3 0 0 (-w) ,
                                V.Vector3 0 w  0 , V.Vector3 0 0    w ,
                                V.Vector3 0 w  0 , V.Vector3 0 0 (-w) ,
                                V.Vector3 0 (-w)  0 , V.Vector3 0 0    w ,
                                V.Vector3 0 (-w)  0 , V.Vector3 0 0 (-w) ,
                                V.Vector3 0 (-w)  0 , V.Vector3 0 0    w ,
                                V.Vector3 0 (-w)  0 , V.Vector3 0 0 (-w)]
                    where
                      w = realToFrac s
