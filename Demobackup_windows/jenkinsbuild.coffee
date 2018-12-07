#Trigger Jenkins job w/o parameters

module.exports = (robot) ->

	robot.hear /trigger pipeline (.*)/i, (msg) ->
		url="http://localhost:8080/job/"+msg.match[1]+"/build?token=remote_enable_token"
		joburl="http://localhost:8080/job/"+msg.match[1]
		msg.http(url)
		.get() (err, res, body) ->
			if err
				msg.reply "Jenkins says: #{err}**** Jenkins URL : #{url}"
			else if 200 <= res.statusCode <400 # Or, not an error code.
				msg.reply "Access validation: You are authorized for build the pipeline"
				msg.reply " Build started for #{msg.match[1]}"
				msg.reply "Deployment status can be found here - #{joburl}"
			else if 400 != res.statusCode
				msg.reply "Build not found, double check that it exists and is spelt correctly"
			else
				msg.reply "Jenkins says: Status #{res.statusCode} #{body}"


	robot.hear /deploy (.*) (.*)/i, (msg) ->
#		url="http://localhost:8080/job/"+msg.match[1]+
#		"/buildWithParameters?token=remote_enable_token&"+msg.match[2]+"="+msg.match[3]
		try
			url="http://localhost:8080/job/"+msg.match[1]+
			"/buildWithParameters?Environment="+msg.match[2]
			joburl="http://localhost:8080/job/"+msg.match[1]
			if msg.match[2] == "PROD"
				msg.reply "Access validation: You are authorized for PROD deployment, please contact Release Management team"
			else if msg.match[2] == "MO"
				msg.reply "Access validation: You are authorized for MO deployment, please contact Release Management team"
			else
				msg.http(url)
				.get() (err, res, body) ->
					if err
						msg.reply "Jenkins says: #{err}**** Jenkins URL : #{url}"
					else if 200 <= res.statusCode <400 # Or, not an error code.					msg.reply " Build started for #{msg.match[1]}"
	#					msg.reply "#{url}"
						msg.reply "Access validation: You are authorized for deployment"
						msg.reply "Deployment started for App: #{msg.match[1]}, Environment: #{msg.match[2]}"
						msg.reply "Deployment status can be found here - #{joburl}"
					else if 400 != res.statusCode
						msg.reply "Build not found, double check if AppName and EnvironmentName are spelt correctly"
						msg.reply "Correct Syntax is : deploy [AppName] [EnvironmentName]"
					else if res.statusCode == 404
						msg.reply "Please provide valid AppName and EnvironmentName"
					else
						msg.reply "Jenkins says: Status #{res.statusCode} #{body}"
		catch error
			msg.send error
	
#	robot.hear /deploy (.*)/i, (msg) ->	
#		msg.reply "Build not found, double check if AppName and EnvironmentName are spelt correctly"
#		msg.reply "Correct Syntax is : deploy [AppName] [EnvironmentName]"

#Trigger Jenkins job w/ parameters
#	robot.hear /deploy/i, (msg) ->
#		msg.reply "Correct Syntax is : deploy [AppName] [EnvironmentName]"