stage 'Provision DEV AWS Stack'
node("master"){
	checkout scm
	sh "terraform plan"
}

stage 'Provision PROD AWS Stack'