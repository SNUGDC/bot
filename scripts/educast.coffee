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

_ = require 'underscore'

module.exports = (robot) ->
  robot.respond /educast\s+(.*)/i, (res) ->
    getSearchResults res, (result) ->
      if result
        res.send result
      else res.send "검색 결과가 없습니다."

getSearchResults = (res, callback) ->
  keyword = encodeURIComponent(res.match[1])
  location = "https://educast.pro/api/latest/search/query?target=course&text=#{keyword}&sorting=-total_popularity"
  res.http(location).get() (error, response, body) ->
    return res.send "문제가 생겼어요." if error
    result = parseResult res, body
    callback result

parseResult = (res, body) ->
  resultObj = JSON.parse body
  randomSearchResultObj = _.sample(resultObj.results)
  if randomSearchResultObj
    randomSearchResultObj.url
  else
    null
