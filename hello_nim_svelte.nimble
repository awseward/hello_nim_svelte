# Package

version       = "0.1.0"
author        = "Andrew Seward"
description   = "Trying out nim with svelte"
license       = "MIT"
srcDir        = "src"
bin           = @["web"]



# Dependencies

requires "jester >= 0.4.3"
requires "nim >= 1.2.0"
requires "nimassets >= 0.1.0"
requires "ulid >= 0.3.0"



# Tasks
task dev, "Run a dev server":
  # The sleep here actually matters so you have a chance to ^C this whole
  # thing. Otherwise it'll run away on you.
  exec """while true; do sleep 1 && find src -type f -name '*.nim' | entr -d -r npm run dev; done"""

task svelte, "Generate svelte bundle":
  exec "npm run build"

task assets, "Generate packaged assets":
  exec "mkdir -vp src/views && echo src/views/assets_file.nim | xargs -t -I{} nimassets --dir=public --output={}"
