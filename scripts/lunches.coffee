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

  robot.brain.data.lunches =
    orders: {}

  lunches =
    get: (name) ->
      robot.brain.data.lunches.orders[name]

    add: (name, order) ->
      robot.brain.data.lunches.orders[name] = order
      robot.brain.data.lunches.last = name
 
    all_orders: () ->
      return robot.brain.data.lunches.orders

    cancel: (name) ->
      delete robot.brain.data.lunches.orders[name]

    clear: () ->
      robot.brain.data.lunches.orders = {}
      delete robot.brain.data.lunches.last

  robot.hear /order me (.*)/i, (msg) ->
    username = msg.message.user.name
    msg.send "So you want to order: " + msg.match[1]
    lunches.add(username, msg.match[1])
    return

  robot.hear /what'?s my/i, (msg) ->
    username = msg.message.user.name
    console.log msg.message.user
    msg.send username + " ordered: " + lunches.get(username)
    return

  robot.hear /show orders/i, (msg) ->
    for own user, order of lunches.all_orders()
      msg.send user + ": " + order

    if (robot.brain.data.lunches.last)
      msg.send "Last order by: " + robot.brain.data.lunches.last
    return

  robot.hear /clear orders/i, (msg) ->
    lunches.clear()
    msg.send "POOF! All gone!"
    return

  robot.hear /cancel my order/i, (msg) ->
    username = msg.message.user.name
    lunches.cancel(username)
    msg.send "Done. But you'll be hungry!"
    return

  robot.hear /lunch help/i, (msg) ->
    msg.send "order me <your order> - to place an order\n" + 
      "what's my order - to refresh your memory\n" +
      "cancel my order - to go on hunger strike\n" +
      "show orders - to see who wants what\n" +
      "clear orders - reset the order list\n"
    return

    
