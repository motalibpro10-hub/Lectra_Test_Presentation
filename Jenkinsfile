pipeline {
    agent any

    environment {
        PYTHON_PATH = "py"   
        OUTPUT_DIR  = "Result"
    }

    stages {

        stage('Checkout GitHub Repository') {
            steps {
                echo "Clonage du dépôt GitHub..."
                git branch: 'master', url: 'https://github.com/motalibpro10-hub/Lectra_Test_Presentation.git'
            }
        }

        stage('Run Robot Framework Tests') {
            steps {
                echo "Exécution des tests Robot Framework..."
                bat """
                    ${PYTHON_PATH} -m robot -d ${OUTPUT_DIR} Tests
                """
            }
        }

        stage('Archive Results in Jenkins') {
            steps {
                echo "Archivage des résultats dans Jenkins..."
                archiveArtifacts artifacts: 'Result/**/*', fingerprint: true
            }
        }

    }

    post {
        always {
            echo "Pipeline terminé."
        }
        success {
            echo "Pipeline exécuté avec succès !"
        }
        failure {
            echo "Une erreur est survenue dans le pipeline."
        }
    }
}
