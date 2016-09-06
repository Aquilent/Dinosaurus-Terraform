env.GIT_URL="git@github.com:neilhunt1/Dinosaurus-Terraform.git"

stage 'Provision DEV AWS Stack'
node("master"){
	checkout scm
	sh "aws s3 cp s3://dinosaurus/terraform-env/terraform-dev.tfstate terraform.tfstate"
	sh "terraform plan"
}
input "Proceed with plan execution?"
node("master"){
	sh "terraform apply"
	sh "aws s3 cp terraform.tfstate s3://dinosaurus/terraform-env/terraform-dev.tfstate"
}

stage 'Provision PROD AWS Stack'{
	node("master"){
		//sh('git -c "user.name=Jenkins" -c "user.email=Jenkins@aquilent.com" tag -a '+tagName+' -m "Jenkins"')
		//pushGit()
	}
}

def pushGit(){
	withCredentials([[$class: 'FileBinding', credentialsId: 'dinosauruspem', variable: 'PEMKEY']]) {
		sh 'rm -rf ~/.ssh/id_rsa' //make sure it's removed
		sh 'cat $PEMKEY > ~/.ssh/id_rsa'
		sh 'chmod 400 ~/.ssh/id_rsa'
		sh 'ls -lhr'
		sh('git -c "user.name=Jenkins" -c "user.email=Jenkins@aquilent.com" push '+env.GIT_URL+' HEAD:master')
		sh 'rm -rf ~/.ssh/id_rsa'
	}
}