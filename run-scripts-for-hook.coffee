fs = require "fs"
path = require "path"
exec = require "sync-exec"

binMap = require "./extension-to-executable"

module.exports = (dir) ->
  results = fs.readdirSync dir
  process.exit 0 unless results.length

  results.forEach (file) ->
    ext = path.extname file
    bin = binMap[ext]
    throw new Error "No binary found for #{ext}" unless bin
    {stdout, stderr, status} = exec "#{bin} #{dir}/#{file}"
    throw new Error stderr if status isnt 0
    console.log "#{file} completed."