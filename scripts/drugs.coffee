# Description:
#   Drugs
#
# Commands:
#   hubot drugs
#
# Notes:
#   

drug_triggers = [
  "paracetamol",
  "nurofen",
  "ibuprofen",
  "brufen",
  "co-codamol",
  "painkillers",
  "pain killers"
]

IN_HIPCHAT = process.env.HUBOT_HIPCHAT_JID?

module.exports = (robot) ->
  for drug in drug_triggers
    pattern = new RegExp("(#{drug})", 'i')
    robot.hear pattern, (msg) ->
      user = msg.message.user
      console.log user
      user.reply_to = user.jid if IN_HIPCHAT
      console.log user
      robot.send user, 'Psssst! I hear you want to buy some drugs...'



    
