module Planets (sun, 
                jupiter, 
                saturn, 
                neptune, 
                uranus, 
                earth, 
                venus, 
                mars, 
                mercury,
                planet1,
                planet2
                ) where

import Data.Vector.V3 as V
import Data.Vector.Class
import Graphics.UI.GLUT
import Body

sun :: Body
sun = Body {
      bRadius   = 0.2,
      bPos      = vpromote 0,
      bVel      = vpromote 0,
      bAcc      = vpromote 0,
      bMass     = 1.0e10,
      bRot      = 0,
      bRotAngle = V.Vector3 0.2 0.5 0.8,
      bRotSpeed = 100,
      bColor    = Color3 1 1 0 }
jupiter = undefined
saturn = undefined
neptune = undefined
uranus = Body {
        bRadius   = 0.1,
        bPos      = V.Vector3 0.5 0.1 0.1,
        bVel      = V.Vector3 0.1 1.0 0.1,
        bAcc      = vpromote 0,
        bMass     = 1.0e-2,
        bRot      = 30,
        bRotAngle = V.Vector3 0.1 0.2 0.3,
        bRotSpeed = 3,
        bColor    = Color3 1 0 1 }
earth = Body {
        bRadius   = 0.1,
        bPos      = V.Vector3 0.1 0.5 0.1,
        bVel      = V.Vector3 0.8 0.1 0.1,
        bAcc      = vpromote 0,
        bMass     = 1.0e-2,
        bRot      = 30,
        bRotAngle = V.Vector3 0.1 0.2 0.3,
        bRotSpeed = 3,
        bColor    = Color3 0 0 1 }
venus = undefined
mars = undefined
mercury = undefined
planet1 = Body {
        bRadius   = 0.1,
        bPos      = V.Vector3 0.0 0.5 0.0,
        bVel      = V.Vector3 1.2 0.0 0.0,
        bAcc      = vpromote 0,
        bMass     = 1,
        bRot      = 30,
        bRotAngle = V.Vector3 0.1 0.2 0.3,
        bRotSpeed = 3,
        bColor    = Color3 1 1 1 }
planet2 = Body {
        bRadius   = 0.1,
        bPos      = V.Vector3 0.0 0.25 0.0,
        bVel      = V.Vector3 1.6 0.0 0.0,
        bAcc      = vpromote 0,
        bMass     = 1,
        bRot      = 30,
        bRotAngle = V.Vector3 0.1 0.2 0.3,
        bRotSpeed = 3,
        bColor    = Color3 1 0 1 }
