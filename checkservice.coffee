# Notes:
#   Parimal First script

module.exports = (robot) ->

   robot.hear /check service (.*)/i, (res) ->
     #serviceurl = "https://www." + res.match[1] + ".com/"
     serviceurl = res.match[1]
     res.http(serviceurl)
     .get() (err, msg, body) ->
     	#res.reply "#{msg.statusCode}"
     	if msg is null
     		res.reply "page not found"
     	else if msg isnt null
     		switch msg.statusCode
     			when 200
     				res.reply "Service #{serviceurl} is available"
     			when 302
     				res.reply "Service #{serviceurl} is available and redirected to "
     			when 404
     				res.reply " Requested page is not found"
     			when 500
     				res.reply " Internal server error"
     			when 504
     				res.reply " The service returned gateway timeout"
     			else
     				res.reply "Unable to process your request"