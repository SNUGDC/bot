# Description:
#   Evaluate one line of Simsimi
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot simsimi <script> - Evaluate one line of Simsimi
#
# Author:
#   momamene

module.exports = (robot) ->
  robot.respond /(simsimi)\s+(.*)/i, (msg)->
    script = msg.match[2]

    msg.http("http://www.simsimi.com/requestChat")
      .query({lc: 'ko', ft: '1.0', req: script})
      .get() (err, res, body) ->
        result = JSON.parse(body)
        msg.send result.res
