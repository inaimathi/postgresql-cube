{-# LANGUAGE OverloadedStrings #-}

module Database.PostgreSQL.Cube (Cube(..))where

import Database.PostgreSQL.Simple.ToField

import Data.List (intersperse, intercalate)
import Data.ByteString.Builder (byteString, char8)

data Cube = Cube [[Float]]

instance ToField Cube where
    toField (Cube cs) = Many $
                        Plain (byteString "CUBE('") :
                        (intercalate [comma] $ map point cs) ++
                        [Plain (byteString "')")]
                            where comma = Plain (char8 ',')
                                  point lst = Plain (char8 '(') :
                                              (intersperse comma $ map toField lst) ++
                                              [Plain (char8 ')')]
