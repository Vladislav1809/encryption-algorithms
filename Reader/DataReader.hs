module Reader.DataReader (readInt, readString) where 

readInt:: IO Int
readInt = readLn

readString:: IO String
readString = getLine

