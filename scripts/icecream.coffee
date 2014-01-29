# Description:
#   Determine if it's time for ice cream yet
#
# Dependencies:
#   "cheerio": "0.7.0"
#
# Configuration:
#   None
#
# Commands:
#   is it time for ice cream yet
#
# Notes:
#   Go to http://isittimeforicecreamyet.com/
#   Check the response
#
# Author:
#   Maurice Kelly

cheerio = require('cheerio')

module.exports = (robot) ->
  robot.hear /is it time for ice\s?cream yet/i, (msg) ->
    msg.send "YES! (It's always time for ice cream!)"
    return
    
    url = "http://isittimeforicecreamyet.com/"
    msg
      .http(url)
      .header('User-Agent', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/536.6 (KHTML, like Gecko) Chrome/20.0.1092.0 Safari/536.6')
      .get() (err, res, body) ->
        if err
          msg.send "Something went wrong #{err}"
          return
        msg.send "#{getIceCreamStatus body}"

getIceCreamStatus = (body, callback) ->
 $ = cheerio.load(body)
 $('body h1').text()