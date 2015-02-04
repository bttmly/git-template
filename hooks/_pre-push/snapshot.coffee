#!/usr/local/bin/coffee

exec = require("child_process").exec
file = "~/.gitshots/#{Date.now()}.jpg"

exec "imagesnap -q -w 3 #{file} &", (err, stdout, stderr) ->
  return console.log "Failed to save snapshot." if err
