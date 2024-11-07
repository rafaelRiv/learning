module Main where

import Graphics.Rendering.OpenGL as GL
import Graphics.UI.GLFW as GLFW
import Control.Monad
import System.Exit ( exitWith, ExitCode(..) )
import System.Environment ( getArgs) 
import qualified Data.Map as M

resizeWindow :: GLFW.WindowSizeCallback
resizeWindow win w h =
  do
    GL.viewport   $= (GL.Position 0 0, GL.Size (fromIntegral w) (fromIntegral h))
    GL.matrixMode $= GL.Projection
    GL.loadIdentity
    GL.ortho2D 0 (realToFrac w) (realToFrac h) 0

keyPressed :: GLFW.KeyCallback 
keyPressed win GLFW.Key'Escape _ GLFW.KeyState'Pressed _ = shutdown win
keyPressed _   _               _ _                     _ = return ()

shutdown :: GLFW.WindowCloseCallback
shutdown win = do
  GLFW.destroyWindow win
  GLFW.terminate
  _ <- exitWith ExitSuccess
  return ()

main :: IO ()
main = do
  log "start"
  cmds <- getArgs 
  if length cmds /= 1 then return ()
  else do
    let func = M.lookup (cmds !! 0) funcTable
    b <- GLFW.init
    log $ "GLFW.init=" ++ (show b)
    GLFW.defaultWindowHints
    Just win <- GLFW.createWindow 480 480 "GLFW Tutorial" Nothing Nothing
    GLFW.makeContextCurrent (Just win)
--    GLFW.setWindowSizeCallback  win (Just resizeWindow)
    GLFW.setKeyCallback         win (Just keyPressed  )
    GLFW.setWindowCloseCallback win (Just shutdown    )
    onDisplay win $ maybe display4Cubes (\x -> displayPrimitive x) func
  where log = putStrLn

onDisplay :: Window -> IO () -> IO ()
onDisplay win io = do
  GL.clear [ColorBuffer]
  io
  GLFW.swapBuffers win
  
  forever $ do
     GLFW.pollEvents
     onDisplay win io

myPoints :: [(GL.GLfloat,GL.GLfloat,GL.GLfloat)]
myPoints = [ (sin (2*pi*k/12), cos (2*pi*k/12), 0) | k <- [1..12] ]

funcTable :: M.Map String PrimitiveMode
funcTable = M.fromList [
    ("points"       ,GL.Points        ),
    ("triangles"    ,GL.Triangles     ),
    ("trianglestrip", GL.TriangleStrip),
    ("trianglefan"  , GL.TriangleFan  ),
    ("trianglelines", GL.Lines        ),
    ("triangleloop" , GL.LineLoop     ),
    ("linestrip"    , GL.LineStrip    ),
    ("quads"        , GL.Quads        ),
    ("polygon"      , GL.Polygon      )
  ]

displayPrimitive :: PrimitiveMode -> IO ()
displayPrimitive pm = do
  GL.renderPrimitive
    pm $ mapM_ (\(x, y, z) -> vertex $ Vertex3 x y z) myPoints

display4Cubes :: IO ()
display4Cubes = do
  let color3f r g b = GL.color $ GL.Color3 r g (b :: GL.GLfloat)
      vertex3f x y z = GL.vertex $ GL.Vertex3 x y (z :: GL.GLfloat)
  clear [ColorBuffer]
  renderPrimitive Quads $ do
    color3f 1 0 0
    vertex3f 0 0 0
    vertex3f 0 0.2 0
    vertex3f 0.2 0.2 0
    vertex3f 0.2 0 0
 
    color3f 0 1 0
    vertex3f 0 0 0
    vertex3f 0 (-0.2) 0
    vertex3f 0.2 (-0.2) 0
    vertex3f 0.2 0 0
 
    color3f 0 0 1
    vertex3f 0 0 0
    vertex3f 0 (-0.2) 0
    vertex3f (-0.2) (-0.2) 0
    vertex3f (-0.2) 0 0
 
    color3f 1 0 1
    vertex3f 0 0 0
    vertex3f 0 0.2 0
    vertex3f (-0.2) 0.2 0
    vertex3f (-0.2) 0 0


