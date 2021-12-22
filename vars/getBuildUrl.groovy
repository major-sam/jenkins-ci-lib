def call(Map config = [:]){          
	def url = "${config.nexusRoot}${config.buildname}:${config.buildname}" +
		"%2F${config.gitBranch}%2F${config.version}%2F${config.gitBranch}-${config.version}-${config.configType}.zip"
	currentBuild.description = currentBuild.description  +"<br><a href=${url}>Nexus Artifact </a> <br>"
	return "<br><a href=${url}>Nexus Artifact </a> <br>"
}
