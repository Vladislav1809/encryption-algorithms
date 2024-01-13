module Algoritm.Caesar (encodeCaesar, decodeCaesar, algoritmCaesar) where

import Data.Char
import Reader.ConsoleDataReader (readInt, readString)

encodeCaesar :: Int -> String -> String
encodeCaesar offset = map (\letter -> chr $ ord letter + offset)

decodeCaesar :: Int -> String -> String
decodeCaesar offset = encodeCaesar (negate offset)

algoritmCaesar :: IO ()
algoritmCaesar = do
  putStr "Your offset number: "
  offset <- readInt
  putStr "Your text: "
  text <- readString

  let result = encodeCaesar offset text
  putStr "Encoded: "
  print result
  putStr "Decoded: "
  print $ decodeCaesar offset result