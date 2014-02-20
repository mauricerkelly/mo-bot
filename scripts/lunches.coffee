# Description:
#   Manage lunch ordering
#
# Commands:
#   hubot lunch help
#
# Notes:
#   

module.exports = (robot) ->

  robot.brain.data.lunches =
    orders: {}
    last: []

  lunches =
    get: (name) ->
      robot.brain.data.lunches.orders[name]

    add: (name, order) ->
      robot.brain.data.lunches.orders[name] = order
      if name not in robot.brain.data.lunches.last
        robot.brain.data.lunches.last.push(name)
 
    all_orders: () ->
      console.log "List of orders: " + robot.brain.data.lunches.orders
      return robot.brain.data.lunches.orders

    cancel: (name) ->
      delete robot.brain.data.lunches.orders[name]
      user_index = robot.brain.data.lunches.last.indexOf name
      if user_index isnt -1
        robot.brain.data.lunches.last.splice(user_index, 1)

    clear: () ->
      robot.brain.data.lunches.orders = {}
      robot.brain.data.lunches.last = []

    last_order: () ->
      console.log "Order order: " + robot.brain.data.lunches.last
      robot.brain.data.lunches.last[robot.brain.data.lunches.last.length - 1]

    order_count: () ->
      Object.keys(robot.brain.data.lunches.orders).length

  robot.hear /^order me (.*)/i, (msg) ->
    username = msg.message.user.name
    msg.send "Got it (" + msg.match[1] + ")"
    lunches.add(username, msg.match[1])
    return

  robot.hear /^show my order/i, (msg) ->
    username = msg.message.user.name
    msg.send lunches.get(username) + " (by " + username + ")"
    return

  robot.hear /^show all orders/i, (msg) ->
    order_list = ""
    for own user, order of lunches.all_orders()
      order_list += order + " (by " + user + ")\n"

    if (lunches.order_count() > 0)
      order_list += "Last order by: " + lunches.last_order()

    console.log order_list
    if order_list isnt ""
      msg.send order_list
    return

  robot.hear /^clear orders/i, (msg) ->
    lunches.clear()
    msg.send "POOF! All gone!"
    return

  robot.hear /^cancel my order/i, (msg) ->
    username = msg.message.user.name
    lunches.cancel(username)
    msg.send "Done. But you'll be hungry!"
    return

  robot.hear /lunch help/i, (msg) ->
    msg.send "order me <your order> - to place an order\n" + 
      "show my order - to refresh your memory\n" +
      "cancel my order - to go on hunger strike\n" +
      "show all orders - to see who wants what\n" +
      "clear orders - reset the order list\n"
    return

    
