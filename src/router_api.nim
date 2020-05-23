import asyncdispatch
import jester
import json

type Game* = object
  id*: string

import oids
import base64

proc initGame(): Game =
  Game(id: encode($genOid()))

let games*: seq[Game] = @[
  initGame(),
  initGame(),
  initGame(),
  initGame(),
  initGame(),
]

router api:
  template okText(thing: untyped): untyped =
    resp Http200, {"Content-Type": "text/plain"}, $thing
  template okJson(json: untyped): untyped =
    resp Http200, {"Content-Type": "application/json"}, $ %json

  get "games":
    okJson games

  post "games":
    okText "TODO: Create endpoint for new game"

  get "game/@id":
    okText "TODO: Show endpoint for game " & @"id"
