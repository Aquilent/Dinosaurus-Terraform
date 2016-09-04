stage 'Provision DEV AWS Stack'
node("master"){
	checkout scm
	sh "terraform plan"
}
input "Proceed with plan execution?"
node("master"){
	sh "terraform apply"
}

stage 'Provision PROD AWS Stack'