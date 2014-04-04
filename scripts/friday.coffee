# Description:
#   A little bit of Rebecca Black in your life.
#


friday_triggers = [
  "friday",
  "we so excited",
  "front seat",
  "back seat",
  "get down"
]

module.exports = (robot) ->

  for trigger in friday_triggers
    pattern = new RegExp("(#{trigger})", 'i')
    robot.hear pattern, (msg) ->
      msg.send "https://www.youtube.com/watch?v=kfVsfOSbJY0"
