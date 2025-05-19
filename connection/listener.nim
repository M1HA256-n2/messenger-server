import asyncdispatch, asyncnet
import ../configuration/ServerConfiguration

type
  Client = ref object
    socket: AsyncSocket
    #TODO: add more parameters like authentification string

var clients: seq[Client] = @[]

proc startServer*() {.async.} =
  let listener = newAsyncSocket()
  listener.setSockOpt(OptReuseAddr, true)
  listener.bindAddr(Port(Config.port), Config.address)
  listener.listen()
  echo "Server listening at ", Config.address, ":", Config.port
  while true:
    #TODO
    discard