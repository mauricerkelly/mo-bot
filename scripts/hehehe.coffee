# Description:
#   Snigger at all the things.
#
# Commands:
#   hubot snigger
#
# Notes:
#   

module.exports = (robot) ->
  robot.hear /snigger/i, (msg) ->
    msg.send "hehehe"

  robot.hear /strap(-|\s)?on/i, (msg) ->
    msg.send "hehehe. You said STRAP ON!"

  robot.hear /rsync/i, (msg) ->
    msg.send "hehehe. You said arse!"

  robot.hear /do do/i, (msg) ->
    msg.send "hehehe. You said doodoo!"

  robot.hear /duty/i, (msg) ->
    msg.send "hehehe. You said doodie!"
  
  robot.hear /\wso big\w/i, (msg) ->
    msg.send "That's what she said! hehehe."
