pipeline {
    agent any
    stages {
        stage('Login') {
            steps {
                sh 'sh login.sh'
            }
        }
        stage('Build') {
            steps {
                sh 'sh build.sh'
            }
        }
        stage('Tag') {
            steps {
                sh 'sh tag.sh'
            }
        }
        stage('Push') {
            steps {
                sh 'sh push.sh'
            }
        }
        stage('Graduate') {
            steps {
                sh 'sh graduate.sh'
            }
        }
    }
    post {
        always {
            cleanWs()
        }
    }
}
Boolean shouldSkipBuild() {
    return sh( script: 'sh check-ci-skip.sh', returnStatus: true )
}
def shHide(cmd) {
    sh('#!/bin/sh -e\n' + cmd)
}
