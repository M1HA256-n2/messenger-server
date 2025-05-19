import os, json
import ../types/ServerConfiguration
    
proc parse*(filename: string): ServerConfiguration =
  #Setup configuration constants
  if not os.fileExists(filename):
    echo "Configuration file not found. Make sure your ", filename, " exist."
  else:
    let text = readFile(filename)
    let jtext = parseJson(text)
    result.address = getStr(jtext["address"])
    result.port = getInt(jtext["port"])
    