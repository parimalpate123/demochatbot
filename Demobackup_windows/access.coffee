module.exports = (robot) ->
   robot.respond /provide me access to (.*)/i, (res) ->
     toolName = res.match[1]
     if toolName is "UCDPROD"
       res.reply "Sailpoint request has been raised on your behalf, You will be notified in the email once it is approved"
     else if toolName is "GitHub"
     	res.reply "Validation completed...You are authorized for access"
     	res.reply "Access has been granted, please validate URL : http://github.mycomp.com/"
     else if toolName is "SVN"
     	res.reply "Validation completed...You are NOT authorized for access"
     	res.reply "Please contact your Manager."
     else if toolName is "servicedesk"
     	res.reply "Access has been granted, please validate URL : http://myservicedesk.mycomp.com/"
     else
       res.reply "Access is not automated through DevOps bot for tool: #{doorType}"