import asyncdispatch
import jester
import json
import os
import sequtils
import strutils

import ./router_web
import ./router_api

let settings = newSettings()
block setPort:
  const key = "PORT"
  if existsEnv key: settings.port = Port parseInt(getEnv key)

routes:
  extend web, ""
  extend api, "/api/"

runForever()
