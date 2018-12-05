# Package

version       = "0.1.0"
author        = "PMunch"
description   = "Nim Language Server Protocol - nimlsp implements the Language Server Protocol"
license       = "MIT"
srcDir        = "src"
bin           = @["nimlsp"]

# Dependencies

requires "nim >= 0.19.0"
#requires "packedjson"
requires "astpatternmatching"
requires "jsonschema >= 0.2.0"

# nimble test does not work for me out of the box
task test, "Runs the test suite":
  #exec "nim c -r tests/test_messages.nim"
  exec "nim c -d:debugLogging -d:jsonSchemaDebug -r tests/test_messages2.nim"

task debug, "Builds the language server":
  exec "nim c -d:debugCommunication -d:debugLogging -d:jsonSchemaDebug -o:nimlsp -d:nimcore -d:nimsuggest --threads:on src/nimlsp"
