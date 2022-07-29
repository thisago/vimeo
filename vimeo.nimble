# Package

version       = "0.1.0"
author        = "Thiago Navarro"
description   = "Vimeo extractor"
license       = "MIT"
srcDir        = "src"
bin           = @["vimeo"]
binDir = "build"


# Dependencies

requires "nim >= 1.6.4"
requires "cligen"
requires "util"
