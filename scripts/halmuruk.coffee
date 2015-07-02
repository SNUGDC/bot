# Description:
#   Hal muruk...
#
# Dependencies:
#   None
#
# Configuration:
#   None
imageMe = require '../src/imageMe'

module.exports = (robot) ->
  robot.respond /shut up/i, (msg) ->
    showMuRuk msg

  robot.respond /꺼져/, (msg) ->
    showMuRuk msg

  robot.respond /닥쳐/, (msg) ->
    showMuRuk msg

  robot.respond /조용히/, (msg) ->
    showMuRuk msg

showMuRuk = (msg) ->
  imageMe msg, '할무룩', (url) ->
    msg.send 'Hal 무룩...', url
