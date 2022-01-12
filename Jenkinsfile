pipeline {

    agent {
        kubernetes {
            yaml """
kind: Pod
metadata:
  name: php
spec:
  containers:
  - name: kaniko
    image: gcr.io/kaniko-project/executor:debug
    command:
    - sleep
    args:
    - 9999999  
    volumeMounts:
    - name: docker-config
      mountPath: /kaniko/.docker
  volumes:
  - name: cache
    persistentVolumeClaim:
      claimName: cache
  - name: docker-config
    secret:
      secretName: docker-hub-credentials
      items:
        - key: .dockerconfigjson
          path: config.json
                """
        }
    }

    stages {
        stage('build') {
            steps {
                container(name: 'kaniko', shell: '/busybox/sh') {
                    script {
                        try {
                            sh """#!/busybox/sh
                            /kaniko/executor --dockerfile=`pwd`/7.4/Dockerfile \\
                                --context=`pwd` \\
                                --destination=docker.io/rendyananta/php-docker:7.4
                            /kaniko/executor --dockerfile=`pwd`/8.0/Dockerfile \\
                                --context=`pwd` \\
                                --destination=docker.io/rendyananta/php-docker:8.0
                            /kaniko/executor --dockerfile=`pwd`/nginx/7.4/Dockerfile \\
                                --context=`pwd` \\
                                --destination=docker.io/rendyananta/php-docker:7.4-nginx
                            /kaniko/executor --dockerfile=`pwd`/nginx/8.0/Dockerfile \\
                                --context=`pwd` \\
                                --destination=docker.io/rendyananta/php-docker:8.0-nginx
                            """
                        } catch (err) {
                            error('Build aborted. Reason: Cannot build container image')
                        }
                    }
                }
            }
        }
    }
}