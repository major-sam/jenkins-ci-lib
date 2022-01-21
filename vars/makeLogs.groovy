def call(String state){          
      println "defaultPostFail"
      def date = new Date().format("[yyyy-MM-DD hh-mm-ss]")
      def buildFolderName = "${date.trim()}-${env.job_base_name}"
      def logsFolder = (isUnix() ? "/var/log/jenkins/buildlogs" : 'c:\\jenkinsLogs')
      def updatesFile = (isUnix() ? 
            "${env.WORKSPACE}/${env.CONFIG_UPDATES}" :
            "${env.WORKSPACE}\\${env.CONFIG_UPDATES}" )
      List paramsList = []
      def envString = ( 
            isUnix() ?
            sh (
                  script:'printenv',
                  returnStdout: true
               ) :                     
            powershell(
                  script:"dir env:", 
                  returnStdout: true, 
                  encoding: 'UTF-8')
      )
      params.each {param ->
             println " ${param.key.toString().trim()} -> ${param.value.toString().trim()} \n"
             paramsList << " ${param.key.toString().trim()} -> ${param.value.toString().trim()} \n"
      }
      dir(logsFolder){
            dir(state){
                  dir(buildFolderName){
                        writeFile(
                              file: 'buildEnv.log',
                              text: envString,
                              encoding: "utf-8"
                        )
                        writeFile(
                              file: 'buildParams.log',
                              text: paramsList.join('\n'),
                              encoding: "UTF-8"
                        )
                        
                        if (fileExists(updatesFile)){
                              writeFile(
                                    file: updateFile,
                                    text: readFile(updatesFile),
                                    encoding: "UTF-8"
                              )
                        }
                  }
            }
      }
}	
