# Notes:
#   Parimal First script

module.exports = (robot) ->

   robot.respond /open the (.*) doors/i, (res) ->
     doorType = res.match[1]
     if doorType is "accenture secure"
       res.reply "I'm afraid I can't let you do that."
     else
       res.reply "Opening #{doorType} doors"

   robot.hear /Hi/i, (res) ->
      res.send "Hello there!"

   robot.hear /who am I?/i, (res) ->
      res.send "This is Parimal!"
  
   robot.hear /I like pie/i, (res) ->
      res.emote "makes a freshly baked pie"

