# Description:
#   A way to get pictures of fillion
#
# Commands:
#   hubot fillion me - Give me a picture of Nathan Fillion

module.exports = (robot) ->
  robot.respond /(fillion|fill)( me)?/i, (msg) ->
    imageMe msg, true, (url) ->
      msg.send url

imageMe = (msg, animated, cb) ->
  cb = animated if typeof animated == 'function'
  q = v: '1.0', rsz: '8', q: "nathan fillion", safe: 'active'
  q.imgtype = 'animated' if typeof animated is 'boolean' and animated is true
  # q.imgtype = 'face' if typeof faces is 'boolean' and faces is true
  msg.http('http://ajax.googleapis.com/ajax/services/search/images')
    .query(q)
    .get() (err, res, body) ->
      images = JSON.parse(body)
      images = images.responseData?.results
      if images?.length > 0
        image  = msg.random images
        cb "#{image.unescapedUrl}#.png"