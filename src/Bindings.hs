module Bindings (idle, display, reshape, keyboardMouse) where

import Graphics.UI.GLUT
import Data.IORef
import Display
 
reshape :: ReshapeCallback
reshape size = viewport $= (Position 0 0, size)
 
keyboardMouse :: KeyboardMouseCallback
{- keyboardMouse key Down _ _ = case key of -}
  {- (Char ' ') -> a $~! negate -}
  {- (Char '+') -> a $~! (* 2) -}
  {- (Char '-') -> a $~! (/ 2) -}
  {- (SpecialKey KeyLeft ) -> p $~! \(x,y) -> (x-0.1,y) -}
  {- (SpecialKey KeyRight) -> p $~! \(x,y) -> (x+0.1,y) -}
  {- (SpecialKey KeyUp   ) -> p $~! \(x,y) -> (x,y+0.1) -}
  {- (SpecialKey KeyDown ) -> p $~! \(x,y) -> (x,y-0.1) -}
  {- _ -> return () -}
keyboardMouse _ _ _ _ = return ()
