# Package

version       = "0.3.0"
author        = "Thiago Navarro"
description   = "Vimeo extractor"
license       = "MIT"
srcDir        = "src"
bin           = @["vimeo"]
binDir = "build"
installExt = @["nim"]


# Dependencies

requires "nim >= 1.6.4"
requires "cligen"
requires "util"

task genDocs, "Generate documentation":
  exec "rm -r docs; nim doc --git.commit:master --git.url:https://github.com/thisago/vimeo --project -d:ssl --out:docs ./src/vimeo.nim"
