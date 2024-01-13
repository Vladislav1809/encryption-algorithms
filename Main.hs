module Main where

import Algoritm.Caesar (algoritmCaesar)
import Algoritm.Vigenere (algoritmVigenere)
import Reader.ConsoleDataReader (readInt)

main :: IO ()
main = do
  putStr "Select algoritm (1 - Caesar, 2 - Vigenere): "
  algoritmIndex <- readInt
  if algoritmIndex == 1
    then algoritmCaesar
    else
      if algoritmIndex == 2
        then algoritmVigenere
        else print "Invalid algoritm index"