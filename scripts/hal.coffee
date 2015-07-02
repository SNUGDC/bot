# Description:
#   Example scripts for you to examine and try out.
#
# Notes:
#   They are commented out by default, because most of them are pretty silly and
#   wouldn't be useful and amusing enough for day to day huboting.
#   Uncomment the ones you want to try and experiment with.
#
#   These are from the scripting documentation: https://github.com/github/hubot/blob/master/docs/scripting.md

imageMe = require '../src/imageMe'

module.exports = (robot) ->
        robot.hear /Open the pod bay doors/i, (res) ->
                res.send "HAL: I'm sorry, Dave. I'm afraid I can't do that."

        robot.hear /도모 (.*)=상 (.*)데스/i, (res) ->
                res.send "도모 #{res.match[2]}=상 #{res.match[1]}데스"
        
        robot.hear /하이쿠를 읊어라/i, (res) ->
                res.send "아이에에에! 사요나라!"

        robot.hear /폭발사산/i, (res) ->
                res.send 'http://pds27.egloos.com/pds/201405/19/00/e0060200_5379f541e7788.png'
