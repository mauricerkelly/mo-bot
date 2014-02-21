# Description:
#   Smack-down people who say totes
#
# Commands:
#   hubot totes - Reply with a picture of totes

amazeballs = [
  "http://quizzicalllama.files.wordpress.com/2014/01/tumblr_mejg10qcbz1rvkhiuo1_500.gif",
  "http://static.guim.co.uk/sys-images/Arts/Arts_/Pictures/2012/2/23/1329993677084/Kelloggs-Totes-Amazeballs-001.jpg"
]

module.exports = (robot) ->

  robot.hear /(totes)/i, (msg) ->
    if /totes ridic/i.test(msg.message.text)
      msg.send "http://i1.cpcache.com/product/19852255/riddick_tote_bag.jpg#.png"
    else
      msg.send "http://3.bp.blogspot.com/_zvi4Em7XHpQ/TQ2512OcbpI/AAAAAAAAEXw/LZgl6hO1iUY/s1600/totes+isotoner+slipper+socks.jpg#.png"

  robot.hear /(amazeballs)/i, (msg) ->
    msg.send msg.random amazeballs