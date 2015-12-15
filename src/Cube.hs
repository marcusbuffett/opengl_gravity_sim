module Cube where
 
import Graphics.UI.GLUT
 
cube :: GLfloat -> IO ()
cube w = renderPrimitive Quads $ mapM_ vertex
  [ Vertex3 w w w    , Vertex3 w w(-w)    , Vertex3 w(-w)(-w)    , Vertex3 w(-w) w      ,
    Vertex3 w w w    , Vertex3 w w(-w)    , Vertex3 (-w) w(-w)   , Vertex3 (-w) w w     ,
    Vertex3 w w w    , Vertex3 w (-w) w   , Vertex3 (-w)(-w) w   , Vertex3 (-w) w w     ,
    Vertex3 (-w) w w , Vertex3 (-w) w(-w) , Vertex3 (-w)(-w)(-w) , Vertex3 (-w)(-w) w   ,
    Vertex3 w(-w) w  , Vertex3 w(-w)(-w)  , Vertex3 (-w)(-w)(-w) , Vertex3 (-w)(-w) w   ,
    Vertex3 w w(-w)  , Vertex3 w(-w)(-w)  , Vertex3 (-w)(-w)(-w) , Vertex3 (-w) w(-w) ]
