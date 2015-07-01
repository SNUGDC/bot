# Description:
#   Get address of club
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot 주소- 동아리방의 주소를 출력
#   hubot address - 동아리방의 주소를 출력

module.exports = (robot) ->
  getAddress = () ->
    addressInBase64 = process.env.ADDRESS
    new Buffer(addressInBase64, 'base64').toString('utf8')

  robot.respond /address/i, (res) ->
    res.reply getAddress()

  robot.respond /주소/, (res) ->
    res.reply getAddress()
