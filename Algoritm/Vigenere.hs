module Algoritm.Vigenere (encodeVigenere, decodeVigenere, algoritmVigenere) where

import Data.Char
import Reader.ConsoleDataReader (readString)

shiftChar :: Char -> Int -> Char
shiftChar char shift =
  if isLower char
    then chr $ ((ord char - ord 'a' + shift) `mod` 26) + ord 'a'
    else chr $ ((ord char - ord 'A' + shift) `mod` 26) + ord 'A'

encodeVigenere :: String -> String -> String
encodeVigenere key text =
  let cycledKey = cycle $ map (\c -> if isLower c then ord c - ord 'a' else ord c - ord 'A') key
   in zipWith shiftChar text cycledKey

decodeVigenere :: String -> String -> String
decodeVigenere key text =
  let cycledKey = cycle $ map (\c -> if isLower c then ord c - ord 'a' else ord c - ord 'A') key
      unshift c k = shiftChar c (-k)
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