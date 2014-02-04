# Description:
#   Snigger at all the things.
#
# Commands:
#   hubot snigger
#
# Notes:
#   

random_values = [
  3,
  4,
  5,
  6,
  7,
  8]

snigger_triggers =
  "snigger": "hehehe",
  "guffaw": "HAHAHA",
  "strap on": "hehehe. You said STRAP ON!",
  "rsync": "hehehe. You said arse!",
  "do do": "hehehe. You said doodoo!",
  "duty": "hehehe. You said doodie!",
  "so big": "That's what she said! hehehe.",
  "json": "hehehe. You said GAYSON!"

module.exports = (robot) ->

  robot.brain.data.hehehe =
    triggers: {}

  hehehe =
    get: (item) ->
      robot.brain.data.hehehe.triggers[item]

    add: (item, count) ->
      robot.brain.data.hehehe.triggers[item] = count

  for trigger, response of snigger_triggers
    pattern = new RegExp("(#{trigger})", 'i')
    robot.hear pattern, (msg) ->
      current_count = hehehe.get(msg.match[1])
      if current_count == null or current_count == undefined or current_count < 0
        current_count = 0
      if current_count == 0
        msg.send snigger_triggers[msg.match[1]]
        hehehe.add(msg.match[1], msg.random random_values)
      else
        current_count = current_count - 1
        hehehe.add(msg.match[1], current_count)



    
