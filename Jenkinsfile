pipeline {
  agent {
    docker {
      image 'jenkins/netcoreagent'
    }
  }

  stages {
    stage('SCM') {
        steps {
          echo "the workspace is: $WORKSPACE"
      		checkout([$class: 'GitSCM', branches: [[name: '*/master']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[url: 'https://github.com/chis0m/DotnetJenkinsPipeline']]])
	      }
    }

    stage('Build') {
          steps {
               sh 'dotnet build "$WORKSPACE/src/EAApp/EAApp.csproj"'
          }
    }

    stage('Publish') {
          steps {
    	      sh 'dotnet publish "$WORKSPACE/src/EAApp/EAApp.csproj"'
            archiveArtifacts artifacts: 'src/EAApp/bin/Debug/netcoreapp3.1/publish/*'
          }
    }
  }
}