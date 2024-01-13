module Utils.Helper (uppercase) where

import Data.Char

uppercase :: String -> String
uppercase = map toUpper