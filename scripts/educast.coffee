
module.export = (robot) ->
        robot.respond /educast (.*)/i, (res) ->
                res.send "https://beta.educast.pro/search/?q=#{res.match[1]}"
