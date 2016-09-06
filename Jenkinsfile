stage 'Provision DEV AWS Stack'
node("master"){
	checkout scm
	sh "terraform plan"
}
input "Proceed with plan execution?"
node("master"){
	sh "terraform apply"
	withCredentials([[$class: 'FileBinding', credentialsId: 'dinosauruspem', variable: 'mykey']]) {
		sh "ls -lhr"
		echo env.GIT_URL
		sh("git tag -a some_tag -m 'Jenkins'")
		sh('git push '+env.GIT_URL+' --tags')
	}
}

stage 'Provision PROD AWS Stack'