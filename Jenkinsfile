
env.GIT_URL="git@github.com:neilhunt1/Dinosaurus-Terraform.git"
stage 'Provision DEV AWS Stack'
node("master"){
	checkout scm
	sh "terraform plan"
	withCredentials([[$class: 'FileBinding', credentialsId: 'dinosauruspem', variable: 'PEMKEY']]) {
		
		sh "ls -lhr"
		echo env.GIT_URL
		sh('git config user.name "Jenkins"')
		sh('git config user.name "Neil.Hunt@aquilent.com"')
		sh("git tag -a some_tag -m 'Jenkins'")
		sh('git push '+env.GIT_URL+' --tags')
	}
}
input "Proceed with plan execution?"
node("master"){
	sh "terraform apply"
}

stage 'Provision PROD AWS Stack'
