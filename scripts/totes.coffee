# Description:
#   Smack-down people who say totes
#
# Commands:
#   hubot totes - Reply with a picture of totes

module.exports = (robot) ->
  robot.respond /(totes)/i, (msg) ->
    msg.send "http://3.bp.blogspot.com/_zvi4Em7XHpQ/TQ2512OcbpI/AAAAAAAAEXw/LZgl6hO1iUY/s1600/totes+isotoner+slipper+socks.jpg#.png"