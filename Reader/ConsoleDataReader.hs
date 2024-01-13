module Reader.ConsoleDataReader (readInt, readString) where 

readInt:: IO Int
readInt = readLn

readString:: IO String
readString = getLine