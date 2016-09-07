env.GIT_URL="git@github.com:neilhunt1/Dinosaurus-Terraform.git"

stage 'Validate DEV AWS Stack'
node("master"){
	checkout scm
	sh "rm -rf terraform.tfstate"
	try{
		sh "aws s3 cp s3://dinosaurus/terraform-env/"+env.BRANCH_NAME+"/terraform-dev.tfstate terraform.tfstate"
	} catch (Exception e) {
		//if terraform.tfstate isn't found in S3, we can catch this exception and assume it's a new environment
		echo "terraform.tfstate doesn't exist in S3 branch, this is a new terraform environment"
	}
	sh "TF_VAR_environment=Dev TF_VAR_environment="+env.BRANCH_NAME+" terraform plan"
}
input "Proceed with Dev provisioning?"

stage 'Provision DEV AWS Stack'
node("master"){
	sh "TF_VAR_environment=Dev TF_VAR_environment="+env.BRANCH_NAME+" terraform apply"
	sh "aws s3 cp terraform.tfstate s3://dinosaurus/terraform-env/"+env.BRANCH_NAME+"/terraform-dev.tfstate"
	sh "rm -rf terraform.tfstate"
}

if(env.BRANCH_NAME=="master"){
	stage 'Validate Prod AWS Stack'
	node("master"){
		checkout scm
		sh "rm -rf terraform.tfstate"
		try{
			sh "aws s3 cp s3://dinosaurus/terraform-env/"+env.BRANCH_NAME+"/terraform-prod.tfstate terraform.tfstate"
		} catch (Exception e) {
			echo "terraform.tfstate doesn't exist in S3 branch, this is a new terraform environment"
		}
		sh "TF_VAR_environment=Prod TF_VAR_environment="+env.BRANCH_NAME+" terraform plan"
	}
	input "Proceed with Prod  provisioning?"
	
	stage 'Provision PROD AWS Stack'
	node("master"){
		sh "TF_VAR_environment=Prod TF_VAR_environment="+env.BRANCH_NAME+" terraform apply"
		sh "aws s3 cp terraform.tfstate s3://dinosaurus/terraform-env/"+env.BRANCH_NAME+"/terraform-prod.tfstate"
		sh "rm -rf terraform.tfstate"
		if(env.BRANCH_NAME=="master"){
			sh('git -c "user.name=Jenkins" -c "user.email=Jenkins@aquilent.com" tag -a Jenkins-'+env.BUILD_ID+' -m "Jenkins"')
			pushGit()
		}
	}
}

def pushGit(){
	withCredentials([[$class: 'FileBinding', credentialsId: 'dinosauruspem', variable: 'PEMKEY']]) {
		sh 'rm -rf ~/.ssh/id_rsa' //make sure it's removed
		sh 'cat $PEMKEY > ~/.ssh/id_rsa'
		sh 'chmod 400 ~/.ssh/id_rsa'
		sh 'ls -lhr'
		sh('git -c "user.name=Jenkins" -c "user.email=Jenkins@aquilent.com" push '+env.GIT_URL+' --tags')
		//sh('git -c "user.name=Jenkins" -c "user.email=Jenkins@aquilent.com" push '+env.GIT_URL+' HEAD:master')
		sh 'rm -rf ~/.ssh/id_rsa'
	}
}
