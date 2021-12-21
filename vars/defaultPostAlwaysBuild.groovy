def call(Map config = [:]){          
	discordSend (
			description: """
			__***Jenkins CI build is ${config.result} for ${config.buildname} repo***__
			**Branch:** ${config.gitBranch}
			**Commit hash:** ${config.gitCommit}
			""",
			footer: 'Provided by Devops team',
			image: '', 
			link: config.buildUrl,
			result: config.result,
			thumbnail: '',
			title: config.buildname,
			webhookURL: config.webhookURL)
    def ISSUE_KEY = false
	if(config.gitBranch ==~ config.regex && config.gitBranch.contains('/')){
		ISSUE_KEY = config.gitBranch.split('/')[1]
	}
	if(ISSUE_KEY){
		description = "Jira task: <a href=https://jira.baltbet.ru:8443/browse/${ISSUE_KEY}>${ISSUE_KEY}</a><br>"
	}
	else{
		description = "No Jira task for this build"
	}
	return description
}	
