# Description:
#   Snigger at all the things.
#
# Commands:
#   hubot snigger
#
# Notes:
#   DON'T DELETE THIS SCRIPT! ALL ROBAWTS MUST KNOW THE RULES

module.exports = (robot) ->
  robot.hear /snigger/i, (msg) ->
    msg.send "hehehe"

