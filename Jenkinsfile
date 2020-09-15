def LABEL_ID = "web-app-${UUID.randomUUID().toString()}"   

podTemplate(
    label: LABEL_ID,  
    cloud: 'k8s',
    containers: [
      containerTemplate(name: 'node-12', image: 'node:14', args: 'cat', command: '/bin/sh -c', ttyEnabled: true),
      containerTemplate(name: 'alpine', image: 'alpine', args: 'cat', command: '/bin/sh -c', ttyEnabled: true),
      containerTemplate(name: 'k8s-kubectl', image: 'jshimko/kube-tools-aws', args: 'cat', command: '/bin/sh -c', ttyEnabled: true)]
)

{ //start pipeline

def IMAGE_VERSION
def IMAGE_FULL
def IMAGE_USER = "10.0.0.222:5000/"
def IMAGE_NAME = "app"
def IMAGEM_TAG 
    
node(LABEL_ID) {
    
  stage('semantic-release') {     
      container('node-12') {        
        echo "Usando semmantic-release"
        checkout([$class: 'GitSCM', userRemoteConfigs: [[url: 'https://github.com/robarros/web-app-devops.git']]])
        sh 'npm ci'
        sh 'npm run release'
        switch (env.BRANCH_NAME) {
          case "master":
            echo "estou na master"
            IMAGE_FULL = "producao"
            IMAGEM_TAG = sh(returnStdout: true, script: "git describe --tags --abbrev=0").trim()
            break
          case "devops":
            echo "estou na devops"
            IMAGE_FULL = "desenvolvimento"
            break
  }}}

  stage('configs') {
      container('alpine') {
        echo 'Alterado as Configuracoes da imagem docker'      
        echo "estou fazendo deploy da imagem de ${IMAGE_FULL}"
        sh "ls -lha"
        sh "pwd"       
        echo "a tag da minha imagem é ${IMAGEM_TAG}"
        echo "ola ${JOB_NAME}"
  }}

}}
