# Notes:
#   Parimal First script

module.exports = (robot) ->

   robot.hear /list of commands/i, (res) ->
#      res.send "Build"
#      res.send "====="
      res.send "start pipeline [App Name]"
#      res.send " "
#      res.send "On-Demand Deployment"
#      res.send "===================="
      res.send "deploy [AppName] [EnvironmentName]"
#      res.send " "
#      res.send "App/Service Health check"
#      res.send "========================"
      res.send "check service [Service Name]"
#      res.send " "
#      res.send "On-Demand Star/Stop/Restart Service"
#      res.send "==================================="
      res.send "start service [Service Name]"
      res.send "stop service [Service Name]"
      res.send "restart service [Service Name]"
#      res.send " "
#      res.send "Access"
#      res.send "======"
      res.send "provide me access to [Tool Name]"