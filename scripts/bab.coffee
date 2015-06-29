# Description:
#   Show bab as image.
#
# Dependencies:
#   aws-sdk
#   moment
#   pageres
#
# Configuration:
#   None
#
# Commands:
#   hubot bab

AWS = require 'aws-sdk'
fs = require 'fs'
moment = require 'moment'
Pageres = require 'pageres'

module.exports = (robot) ->

  fileName = () -> moment().format('YYYY-MM-DD')
  fullPath = () -> __dirname + '/' + fileName() + '.png'

  upload = (res) ->
    s3 = new AWS.S3()
    fs.stat fullPath(), (err, fileInfo) ->
      if (err)
        return res.reply 'failed : ' + err + ', ' + err.message
      bodyStream = fs.createReadStream fullPath()

      s3.putObject {
        Bucket: 'slack-menu',
        Key: fileName() + '.png',
        Body: bodyStream,
        ACL: 'public-read',
        Expires: moment().add(1, 'months').toDate()
      }, (err) ->
        if (err)
          res.reply 'failed : ' + err + ',' + err.message
        else
          remove res
          res.reply 'https://s3-ap-northeast-1.amazonaws.com/slack-menu/' + fileName() + '.png'

  remove = (res) ->
    fs.unlink fullPath(), (err) ->
      res.reply 'Error on unlinking temporary image file. ' + err if err

  robot.respond /bab/i, (res) ->
    pageres = new Pageres({delay: 2, filename: fileName()})
      # .src('yeoman.io', ['480x320', '1024x768', 'iphone 5s'], {crop: true})
      .src('mini.snu.kr/cafe/today/', ['1280x1024'])
      .dest(__dirname)

    pageres.run (err) ->
      if (err)
        res.reply 'done'
      else
        res.reply 'captured'
        upload res
