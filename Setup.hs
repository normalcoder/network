module Main (main) where

import Distribution.Simple
import System.Process (callCommand)

main :: IO ()
main = do
 defaultMainWithHooks autoconfUserHooks
  { preConf = \args flags -> do
        callCommand "echo 'Running autoreconf -i...'"
        callCommand "autoreconf -i"
        preConf autoconfUserHooks args flags
  }
