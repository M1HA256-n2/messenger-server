import os, json

type
  ServerConfig* = object
    address*: string
    port*: int
    
proc parse*(filename: string): ServerConfig =
  #Setup configuration constants
  if not os.fileExists(filename):
    echo "Configuration file not found. Make sure your ", filename, " exist."
  else:
    let text = readFile(filename)
    let jtext = parseJson(text)
    result.address = getStr(jtext["address"])
    result.port = getInt(jtext["port"])
    