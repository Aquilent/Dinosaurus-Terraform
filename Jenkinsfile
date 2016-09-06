
env.GIT_URL="git@github.com:neilhunt1/Dinosaurus-Terraform.git"
stage 'Provision DEV AWS Stack'
node("master"){
	checkout scm
	sh "terraform plan"
	withCredentials([[$class: 'FileBinding', credentialsId: 'dinosauruspem', variable: 'PEMKEY']]) {
		
		sh "ls -lhr"
		sh 'cat $PEMKEY > ~/.ssh/id_rsa'
		sh 'chmod 400 ~/.ssh/id_rsa'
		echo env.GIT_URL
		sh('git -c "user.name=Jenkins" -c "user.email=Neil.Hunt@aquilent.com" tag -a Build-'+env.BUILD_ID+' -m "Jenkins"')
		sh('git -c "user.name=Jenkins" -c "user.email=Neil.Hunt@aquilent.com" push '+env.GIT_URL+' --tags')
	}
}
input "Proceed with plan execution?"
node("master"){
	sh "terraform apply"
}

stage 'Provision PROD AWS Stack'
