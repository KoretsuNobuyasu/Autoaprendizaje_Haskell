{-# LANGUAGE CPP #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
{-# OPTIONS_GHC -fno-warn-implicit-prelude #-}
module Paths_funpaala (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/Users/nobu/GitHub/Autoaprendizaje_Haskell/funpaala/.stack-work/install/x86_64-osx/56635865b0eba1a7460560921677827947d27b9e31aaea97117ead788d25be19/8.0.2/bin"
libdir     = "/Users/nobu/GitHub/Autoaprendizaje_Haskell/funpaala/.stack-work/install/x86_64-osx/56635865b0eba1a7460560921677827947d27b9e31aaea97117ead788d25be19/8.0.2/lib/x86_64-osx-ghc-8.0.2/funpaala-0.1.0.0-Ert2bBZ7bcZv3HI3i9flt"
dynlibdir  = "/Users/nobu/GitHub/Autoaprendizaje_Haskell/funpaala/.stack-work/install/x86_64-osx/56635865b0eba1a7460560921677827947d27b9e31aaea97117ead788d25be19/8.0.2/lib/x86_64-osx-ghc-8.0.2"
datadir    = "/Users/nobu/GitHub/Autoaprendizaje_Haskell/funpaala/.stack-work/install/x86_64-osx/56635865b0eba1a7460560921677827947d27b9e31aaea97117ead788d25be19/8.0.2/share/x86_64-osx-ghc-8.0.2/funpaala-0.1.0.0"
libexecdir = "/Users/nobu/GitHub/Autoaprendizaje_Haskell/funpaala/.stack-work/install/x86_64-osx/56635865b0eba1a7460560921677827947d27b9e31aaea97117ead788d25be19/8.0.2/libexec"
sysconfdir = "/Users/nobu/GitHub/Autoaprendizaje_Haskell/funpaala/.stack-work/install/x86_64-osx/56635865b0eba1a7460560921677827947d27b9e31aaea97117ead788d25be19/8.0.2/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "funpaala_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "funpaala_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "funpaala_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "funpaala_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "funpaala_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "funpaala_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
