import asyncdispatch, asyncnet
import ../configuration/ParseConfig

type
  Client = ref object
    socket: AsyncSocket
    #TODO: add more parameters like authentification string

const
  ConfigurationFile = "config.json"
  Config* = ParseConfig.parse(ConfigurationFile)

var clients: seq[Client] = @[]

proc startServer*() {.async.} =
  let listener = newAsyncSocket()
  listener.setSockOpt(OptReuseAddr, true)
  listener.bindAddr(Port(Config.port), Config.address)
  listener.listen()
  while true:
    #TODO
    discard