def call(Map config = [:]){          
	def url = "${config.nexusRoot}/${config.buildname}/${config.buildname}/${config.gitBranch}/${config.version}"
	writeFile file: 'link.html', text:	"<a href=${url}>Nexus Artifact </a> <br>" 
	archiveArtifacts allowEmptyArchive: true, artifacts: 'link.html', caseSensitive: false, followSymlinks: false
}
