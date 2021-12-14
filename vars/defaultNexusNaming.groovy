def call(String BranchName){          
		  return BranchName.replaceAll('/', '-').replaceAll('\\\\','-')
      }	
