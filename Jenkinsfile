

stage 'Provision DEV AWS Stack'
node("master"){
	checkout scm
	sh "terraform plan"
	withCredentials([[$class: 'FileBinding', credentialsId: 'dinosauruspem', variable: 'mykey']]) {
		sh "ls -lhr"
		echo env.GIT_BRANCH
		sh "cat $mykey"
		sh("git tag -a some_tag -m 'Jenkins'")
		sh('git push '+env.GIT_URL+' --tags')
	}
}
input "Proceed with plan execution?"
node("master"){
	sh "terraform apply"
}

stage 'Provision PROD AWS Stack'
