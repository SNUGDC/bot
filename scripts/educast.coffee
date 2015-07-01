# Description:
#   Search from to educast
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot educast <keyword> - Search from educast

module.exports = (robot) ->
        robot.respond /educast\s+(.*)/i, (res) ->
                keyword = encodeURIComponent(res.match[1])
                res.send "https://beta.educast.pro/search/?q=#{keyword}"
