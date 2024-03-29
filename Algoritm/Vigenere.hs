module Algoritm.Vigenere (encodeVigenere, decodeVigenere, algoritmVigenere) where

import Data.Char
import Reader.DataReader (readString)

encodeVigenere :: String -> String -> String
encodeVigenere key text =
  let cycledKey = map ord (cycle key)
      shift first second = chr $ mod (ord first - ord 'A' + second) 26 + ord 'A'
   in zipWith shift text cycledKey

decodeVigenere :: String -> String -> String
decodeVigenere key text =
  let cycledKey = map ord (cycle key)
      unshift first second = chr $ mod (ord first - ord 'A' - second) 26 + ord 'A'
   in zipWith unshift text cycledKey

algoritmVigenere :: IO ()
algoritmVigenere = do
  putStr "Your key: "
  key <- readString
  putStr "Your text: "
  text <- readString

  let result = encodeVigenere key text
  putStr "Encoded: "
  print result
  putStr "Decoded: "
  print $ decodeVigenere key result